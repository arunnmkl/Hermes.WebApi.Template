﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Hermes.WebApi.Base.SqlSerializer;
using Hermes.WebApi.Security.Models;
using Hermes.WebApi.Security.Models.Enums;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// Authentication repository.
    /// </summary>
    public class AuthSqlRepository : IDisposable
    {
        /// <summary>
        /// The SQL serializer
        /// </summary>
        private readonly SqlSerializer sqlSerializer;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthSqlRepository"/> class.
        /// </summary>
        /// <param name="sqlSerializer">The SQL serializer.</param>
        internal AuthSqlRepository(SqlSerializer sqlSerializer)
        {
            this.sqlSerializer = sqlSerializer;
        }

        /// <summary>
        /// Authenticates the username password.
        /// </summary>
        /// <param name="username">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        internal UserIdentity AuthenticateUsernamePassword(string username, string password)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[AuthenticateUsernamePassword]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");

            var parameters = new[]
            {
                new Parameter("@Username", username),
                new Parameter("@Password", password)
            };

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameters: parameters, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(ap => { userIdentity.AuthProviders.Add(ap); });

            return userIdentity;
        }

        /// <summary>
        /// Adds the refresh token.
        /// </summary>
        /// <param name="token">The token.</param>
        /// <returns>success or failure</returns>
        internal bool AddRefreshToken(RefreshToken token)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[AddRefreshToken]";

            var parameters = new[]
            {
                new Parameter("@RefreshTokenId", token.RefreshTokenId),
                new Parameter("@Username", token.Username),
                new Parameter("@AuthClientId", token.AuthClientId),
                new Parameter("@IssuedUtc", token.IssuedUtc),
                new Parameter("@ExpiresUtc", token.ExpiresUtc),
                new Parameter("@ProtectedTicket", token.ProtectedTicket),
                new Parameter("@UserAuthTokenId", token.UserAuthTokenId)
            };

            this.sqlSerializer.Execute(commandText, parameters: parameters, storedProcedure: true);

            return true;
        }

        /// <summary>
        /// Finds the refresh token.
        /// </summary>
        /// <param name="hashedTokenId">The hashed token identifier.</param>
        /// <returns>refresh token</returns>
        internal RefreshToken FindRefreshToken(string hashedTokenId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[FindRefreshToken]";

            var parameter = new Parameter("@RefreshTokenId", hashedTokenId);

            return this.sqlSerializer.DeserializeSingleRecord<RefreshToken>(commandText, parameter: parameter, storedProcedure: true);
        }

        /// <summary>
        /// Removes the refresh token.
        /// </summary>
        /// <param name="tokenId">The token identifier.</param>
        /// <returns>
        /// success or failure
        /// </returns>
        internal bool RemoveRefreshToken(string tokenId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[RemoveRefreshToken]";

            var parameter = new Parameter("@RefreshTokenId", tokenId);

            this.sqlSerializer.Execute(commandText, parameter: parameter, storedProcedure: true);

            return true;
        }

        /// <summary>
        /// Gets all refresh tokens.
        /// </summary>
        /// <returns>all refresh tokens</returns>
        internal IList<RefreshToken> GetAllRefreshTokens()
        {
            string commandText = $"{AuthContext.SecuritySchema}.[GetAllRefreshToken]";

            return this.sqlSerializer.DeserializeMultiRecords<RefreshToken>(commandText, storedProcedure: true);
        }

        /// <summary>
        /// Finds the authentication client.
        /// </summary>
        /// <param name="clientId">The client identifier.</param>
        /// <returns>authentication client information</returns>
        internal AuthClient FindAuthClient(string clientId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[FindAuthClientById]";

            var param = new Parameter("@authClientId", clientId);

            return this.sqlSerializer.DeserializeSingleRecord<AuthClient>(commandText, param, storedProcedure: true);
        }

        /// <summary>
        /// Finds the login provider.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        internal UserIdentity FindLoginProvider(AuthProvider authProvider)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[FindLoginProvider]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");

            var parameters = new[]
            {
                new Parameter("@loginProvider", authProvider.LoginProvider),
                new Parameter("@providerKey", authProvider.ProviderKey)
            };

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameters: parameters, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(ap => { userIdentity.AuthProviders.Add(ap); });

            return userIdentity;
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="emailAddress">The email address.</param>
        /// <param name="enabled">if set to <c>true</c> [enabled].</param>
        /// <returns>user id</returns>
        internal long AddUser(string username, string password, string emailAddress, bool enabled)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[AddNewUser]";

            var parameters = new[]
            {
                new Parameter("@UserName", username),
                new Parameter("@Password", string.IsNullOrEmpty(password)? null : password),
                new Parameter("@EmailAddress", string.IsNullOrEmpty(emailAddress)? null : emailAddress),
                new Parameter("@Enabled", enabled)
            };

            try
            {
                return this.sqlSerializer.ExecuteScalar<long>(commandText, parameters: parameters, storedProcedure: true);
            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Errors.Count > 0 && sqlEx.Errors[0].Number == 45120)
                {
                    throw new BadRequestException(sqlEx.Errors[0].Message);
                }

                throw;
            }
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// inserted state.
        /// </returns>
        internal bool AddNewUserLoginProvider(AuthProvider authProvider)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[AddNewUserLoginProvider]";

            var parameters = new[]
            {
                new Parameter("@UserId", authProvider.UserId),
                new Parameter("@LoginProvider", authProvider.LoginProvider),
                new Parameter("@ProviderKey", authProvider.ProviderKey)
            };

            this.sqlSerializer.Execute(commandText, parameters: parameters, storedProcedure: true);

            return true;
        }

        /// <summary>
        /// Gets the authenticated user by user identifier.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        internal UserIdentity GetAuthenticatedUserByUserId(long userId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[GetAuthenticatedUser]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");
            sets.AddSet<string>("UserAuthTokenId");

            var param = new Parameter("@UserId", userId);

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameter: param, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(ap => { userIdentity.AuthProviders.Add(ap); });

            userIdentity.UserAuthTokenId = sets.GetSet<string>("UserAuthTokenId").FirstOrDefault();

            return userIdentity;
        }

        /// <summary>
        /// Gets the user permissions.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>user permissions</returns>
        internal IList<ResourceAccessRule> GetUserPermissions(long userId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[spGetUserPermissions]";

            var param = new Parameter("@userID", userId);

            return this.sqlSerializer.DeserializeMultiRecords<ResourceAccessRule>(commandText, param, storedProcedure: true);
        }

        /// <summary>
        /// Gets the user resource permission.
        /// </summary>
        /// <param name="securityIds">The security ids.</param>
        /// <returns>user resource permissions</returns>
        internal IList<ResourceAccessRule> GetUserResourcePermission(IList<Guid> securityIds)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[spGetUserResourcePermission]";

            var param = new Parameter("@SIDList", GetSecurityIdsAsDatatable(securityIds), $"{AuthContext.SecuritySchema}.SecurityIdList");

            return this.sqlSerializer.DeserializeMultiRecords<ResourceAccessRule>(commandText, param, storedProcedure: true);
        }

        /// <summary>
        /// Saves the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>saved state</returns>
        internal bool SaveUserAuthToken(UserAuthToken userAuthToken)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[SaveUserAuthToken]";

            var parameters = new[]
            {
                new Parameter("@UserAuthTokenId", userAuthToken.UserAuthTokenId),
                new Parameter("@UserId", userAuthToken.UserId),
                new Parameter("@AuthClientId", userAuthToken.AuthClientId),
                new Parameter("@IssuedUtc", userAuthToken.IssuedUtc),
                new Parameter("@ExpiresUtc", userAuthToken.ExpiresUtc),
                new Parameter("@AccessToken", userAuthToken.AccessToken)
            };

            try
            {
                this.sqlSerializer.Execute(commandText, parameters: parameters, storedProcedure: true);
                return true;
            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Errors.Count > 0 && sqlEx.Errors[0].Message.Equals(string.Format("The specified value {0} already exists.", userAuthToken.UserId)))
                {
                    //throw new BadRequestException(sqlEx.Errors[0].Message);
                    return false;
                }

                throw;
            }
        }

        /// <summary>
        /// Gets the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>
        /// the user authentication token details
        /// </returns>
        internal UserAuthToken GetUserAuthToken(UserAuthToken userAuthToken)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[GetUserAuthToken]";

            var parameters = new[]
            {
                new Parameter("@UserId", userAuthToken.UserId),
                new Parameter("@AccessToken", userAuthToken.AccessToken)
            };

            return sqlSerializer.DeserializeSingleRecord<UserAuthToken>(commandText, parameters: parameters, storedProcedure: true);
        }

        /// <summary>
        /// Sets the token expires.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <param name="userAuthTokenId">The user authentication token identifier.</param>
        /// <returns>
        /// row count
        /// </returns>
        internal int SetTokenExpires(long userId, string userAuthTokenId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[SetTokenExpires]";

            var parameters = new[]
            {
                new Parameter("@UserId", userId),
                new Parameter("@UserAuthTokenId", userAuthTokenId)
            };

            return this.sqlSerializer.ExecuteScalar<int>(commandText, parameters: parameters, storedProcedure: true);
        }

        /// <summary>
        /// Generates the authentication token.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="checkExistence">if set to <c>true</c> [check existence].</param>
        /// <param name="killOldSession">if set to <c>true</c> [kill old session].</param>
        /// <returns>the new authentication token</returns>
        internal string GenerateAuthToken(string username, bool checkExistence = false, bool killOldSession = false)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[GenerateUserAuthToken]";

            var parameters = new[]
            {
                new Parameter("@Username", username),
                new Parameter("@CheckExistence", checkExistence),
                new Parameter("@KillOldSession", killOldSession)
            };

            return this.sqlSerializer.ExecuteScalar<string>(commandText, parameters: parameters, storedProcedure: true);
        }

        /// <summary>
        /// Gets the user authentication token by identifier.
        /// </summary>
        /// <param name="userAuthTokenId">The user authentication token identifier.</param>
        /// <returns>
        /// the user authentication token details
        /// </returns>
        internal UserAuthToken GetUserAuthTokenById(string userAuthTokenId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.[GetUserAuthTokenById]";

            var parameter = new Parameter("@UserAuthTokenId", userAuthTokenId);

            return sqlSerializer.DeserializeSingleRecord<UserAuthToken>(commandText, parameter: parameter, storedProcedure: true);
        }

        /// <summary>
        /// Gets the permissions.
        /// </summary>
        /// <returns>the list of permissions</returns>
        internal IList<Models.Permission> GetPermissions()
        {
            string commandText = $"SELECT PermissionId, Name FROM {AuthContext.SecuritySchema}.[Permission]";
            return sqlSerializer.DeserializeMultiRecords<Models.Permission>(commandText, (Parameter)null, false, false);
        }

        /// <summary>
        /// Gets the resources.
        /// </summary>
        /// <returns>
        /// the list of resources
        /// </returns>
        internal IList<Resource> GetResources()
        {
            string commandText = $"SELECT ResourceId, Name FROM {AuthContext.SecuritySchema}.[Resource]";
            return sqlSerializer.DeserializeMultiRecords<Resource>(commandText, (Parameter)null, false, false);
        }

        /// <summary>
        /// Checks the authorization.
        /// </summary>
        /// <param name="resourceId">The resource identifier.</param>
        /// <param name="securityIds">The security ids.</param>
        /// <param name="permissionId">The permission identifier.</param>
        /// <returns>authorization type</returns>
        internal AuthorizationType CheckAuthorization(Guid resourceId, IList<string> securityIds, int permissionId)
        {
            return CheckAuthorization(resourceId, GetSecurityIdsAsDatatable(securityIds), permissionId);
        }

        /// <summary>
        /// Checks the authorization.
        /// </summary>
        /// <param name="resourceId">The resource identifier.</param>
        /// <param name="securityIds">The security ids.</param>
        /// <param name="permissionId">The permission identifier.</param>
        /// <returns>authorization type</returns>
        internal AuthorizationType CheckAuthorization(Guid resourceId, IList<Guid> securityIds, int permissionId)
        {
            return CheckAuthorization(resourceId, GetSecurityIdsAsDatatable(securityIds), permissionId);
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources.
        /// </summary>
        /// <param name="disposing"><c>true</c> to release both managed and unmanaged resources; <c>false</c> to release only unmanaged resources.</param>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                //// Dispose any managed objects
            }
        }

        /// <summary>
        /// Gets the security ids as data table.
        /// </summary>
        /// <returns>security ids list as data table</returns>
        private DataTable GetSecurityIdsAsDatatable(IList<string> securityIds)
        {
            using (DataTable dtSecurityIds = new DataTable("SIDList"))
            {
                dtSecurityIds.Locale = System.Globalization.CultureInfo.InvariantCulture;
                dtSecurityIds.Columns.Add("SID", type: typeof(string));
                foreach (var item in securityIds)
                {
                    dtSecurityIds.Rows.Add(item.ToString());
                }

                return dtSecurityIds;
            }
        }

        /// <summary>
        /// Gets the security ids as data table.
        /// </summary>
        /// <returns>security ids list as data table</returns>
        private DataTable GetSecurityIdsAsDatatable(IList<Guid> securityIds)
        {
            using (DataTable dtSecurityIds = new DataTable("SIDList"))
            {
                dtSecurityIds.Locale = System.Globalization.CultureInfo.InvariantCulture;
                dtSecurityIds.Columns.Add("SID", type: typeof(Guid));
                foreach (var item in securityIds)
                {
                    dtSecurityIds.Rows.Add(item.ToString());
                }

                return dtSecurityIds;
            }
        }

        /// <summary>
        /// Checks the authorization.
        /// </summary>
        /// <param name="resourceId">The resource identifier.</param>
        /// <param name="securityIds">The security ids.</param>
        /// <param name="permissionId">The permission identifier.</param>
        /// <returns>authorization type</returns>
        private AuthorizationType CheckAuthorization(Guid resourceId, DataTable securityIds, int permissionId)
        {
            string commandText = $"{AuthContext.SecuritySchema}.CheckAuthorization";

            var parameters = new[]
            {
                new Parameter("@ResourceId", resourceId),
                new Parameter("@SecurityIdList", securityIds, $"{AuthContext.SecuritySchema}.SecurityIdList"),
                new Parameter("@PermissionId", permissionId)
            };

            using (SqlSerializerExtensions.CreateTransactionScope(sqlSerializer, System.Transactions.TransactionScopeOption.Suppress, System.Transactions.IsolationLevel.ReadCommitted, new int?()))
            {
                return sqlSerializer.ExecuteScalar<Models.Enums.AuthorizationType>(commandText, parameters, storedProcedure: true);
            }
        }
    }
}
