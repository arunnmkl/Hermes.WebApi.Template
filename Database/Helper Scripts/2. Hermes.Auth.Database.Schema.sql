USE [HermesAuthDB]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AccessControlList', N'COLUMN',N'SecurityId'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccessControlList', @level2type=N'COLUMN',@level2name=N'SecurityId'

GO
/****** Object:  StoredProcedure [dbo].[spRevokePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRevokePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spRevokePermission]
GO
/****** Object:  StoredProcedure [dbo].[spGrantPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGrantPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGrantPermission]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserResourcePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetUserResourcePermission]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserPermissions]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserPermissions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetUserPermissions]
GO
/****** Object:  StoredProcedure [dbo].[SetTokenExpires]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetTokenExpires]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetTokenExpires]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[RoleExists]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RoleExists]
GO
/****** Object:  StoredProcedure [dbo].[RemoveRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[ListSecurityRolesByUserName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListSecurityRolesByUserName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListSecurityRolesByUserName]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthTokenId]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthTokenById]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAuthenticatedUser]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[GenerateUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenerateUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GenerateUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[FindRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[FindLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindLoginProvider]
GO
/****** Object:  StoredProcedure [dbo].[FindAuthClientById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindAuthClientById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindAuthClientById]
GO
/****** Object:  StoredProcedure [dbo].[CheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckAuthorization]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckAuthorization]
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUsernamePassword]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthenticateUsernamePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AuthenticateUsernamePassword]
GO
/****** Object:  StoredProcedure [dbo].[AddUserToRoleByName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddUserToRoleByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddUserToRoleByName]
GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUserLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddNewUserLoginProvider]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddNewUser]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]'))
ALTER TABLE [dbo].[UserLoginProvider] DROP CONSTRAINT [FK_UserLoginProvider_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAuthToken]'))
ALTER TABLE [dbo].[UserAuthToken] DROP CONSTRAINT [FK_UserAuthToken_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Role]'))
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [FK_Role_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Resource]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[RefreshToken]'))
ALTER TABLE [dbo].[RefreshToken] DROP CONSTRAINT [FK_RefreshToken_AuthClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_AccessControlList]
GO
/****** Object:  Index [IX_AccessPermissionJoin_SecurityIdPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_SecurityIdPermission')
DROP INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermissionJoin_PermissionResourceId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_PermissionResourceId')
DROP INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermission_ResourceIdDeny]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermission_ResourceIdDeny')
DROP INDEX [IX_AccessPermission_ResourceIdDeny] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User')
DROP INDEX [IX_User] ON [dbo].[User]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND name = N'IX_ResourcePermission')
DROP INDEX [IX_ResourcePermission] ON [dbo].[ResourcePermission]
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND name = N'IX_AccessControlList')
DROP INDEX [IX_AccessControlList] ON [dbo].[AccessControlList]
GO
/****** Object:  View [dbo].[ResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceAccess]'))
DROP VIEW [dbo].[ResourceAccess]
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceOwner]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceOwner]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetResourceOwner]
GO
/****** Object:  Index [PK_ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]') AND name = N'PK_ResourceOwnerUser')
DROP INDEX [PK_ResourceOwnerUser] ON [dbo].[ResourceOwnerUser] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]'))
DROP VIEW [dbo].[ResourceOwnerUser]
GO
/****** Object:  Index [PK_ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]') AND name = N'PK_ResourceOwnerRole')
DROP INDEX [PK_ResourceOwnerRole] ON [dbo].[ResourceOwnerRole] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]'))
DROP VIEW [dbo].[ResourceOwnerRole]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserSecurityIdRelatedSecurityIds]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserSecurityIdRelatedSecurityIds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetUserSecurityIdRelatedSecurityIds]
GO
/****** Object:  Index [IX_UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]') AND name = N'IX_UserRoleSecurityId')
DROP INDEX [IX_UserRoleSecurityId] ON [dbo].[UserRoleSecurityId] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]'))
DROP VIEW [dbo].[UserRoleSecurityId]
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceAccess]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetResourceAccess]
GO
/****** Object:  View [dbo].[AccessPermissionAllowDenyJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionAllowDenyJoin]'))
DROP VIEW [dbo].[AccessPermissionAllowDenyJoin]
GO
/****** Object:  Index [PK_AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'PK_AccessPermissionJoin')
DROP INDEX [PK_AccessPermissionJoin] ON [dbo].[AccessPermissionJoin] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]'))
DROP VIEW [dbo].[AccessPermissionJoin]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[UserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]') AND type in (N'U'))
DROP TABLE [dbo].[UserLoginProvider]
GO
/****** Object:  Table [dbo].[UserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthToken]') AND type in (N'U'))
DROP TABLE [dbo].[UserAuthToken]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND type in (N'U'))
DROP TABLE [dbo].[ResourcePermission]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
DROP TABLE [dbo].[Resource]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefreshToken]') AND type in (N'U'))
DROP TABLE [dbo].[RefreshToken]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
GO
/****** Object:  Table [dbo].[AuthClient]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthClient]') AND type in (N'U'))
DROP TABLE [dbo].[AuthClient]
GO
/****** Object:  Table [dbo].[AccessPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermission]') AND type in (N'U'))
DROP TABLE [dbo].[AccessPermission]
GO
/****** Object:  Table [dbo].[AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND type in (N'U'))
DROP TABLE [dbo].[AccessControlList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnCheckAuthorization]
GO
/****** Object:  UserDefinedTableType [dbo].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'dbo')
DROP TYPE [dbo].[SecurityIdList]
GO
/****** Object:  UserDefinedTableType [dbo].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'dbo')
CREATE TYPE [dbo].[SecurityIdList] AS TABLE(
	[SecurityId] [uniqueidentifier] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[SecurityId] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fnCheckAuthorization] (
	@ResourceId UNIQUEIDENTIFIER
	,@SecurityIdList dbo.SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS BIT
AS
BEGIN
	DECLARE @IsOwner BIT = 0
	DECLARE @DenyCount INT = 0;
	DECLARE @AllowCount INT = 0;
	DECLARE @ExpandedSecurityIdList dbo.SecurityIdList;

	INSERT INTO @ExpandedSecurityIdList
	SELECT [SecurityId]
	FROM @SecurityIdLIST
	
	UNION
	
	SELECT [SecurityId]
	FROM dbo.[Role]
	WHERE NAME = ''Anonymous'';

	--Owner->Deny->Allow->Nothing
	IF EXISTS (SELECT TOP 1 1 FROM dbo.GetResourceOwner(@ResourceId) o INNER JOIN @ExpandedSecurityIdList s ON o.[SecurityId] = s.[SecurityId])	
	BEGIN
		SELECT @IsOwner = 1
	END
	ELSE
	BEGIN
		SELECT @DenyCount = COUNT(*)
		FROM @ExpandedSecurityIdList AS [SecurityIds]
		INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
			AND AP.ResourceId = @ResourceId
			AND AP.PermissionId = @PermissionId
			AND [Deny] = 1;

		IF @DenyCount = 0
		BEGIN
			SELECT @AllowCount = COUNT(*)
			FROM @ExpandedSecurityIdList AS [SecurityIds]
			INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
				AND AP.ResourceId = @ResourceId
				AND AP.PermissionId = @PermissionId
				AND [Deny] = 0;
		END;
	END;

	--RETURN VALUE IS A BIT FIELD
	--None = 0x0, 
	--Access = 0x1
	DECLARE @RetVal INT = 0;

	IF @IsOwner = 1 OR (@DenyCount = 0 AND @AllowCount > 0)
	BEGIN
		SET @RetVal = 1;
	END;

	RETURN @RetVal;
END;

' 
END

GO
/****** Object:  Table [dbo].[AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccessControlList](
	[AccessControlListId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[IsOwner] [bit] NOT NULL CONSTRAINT [DF_AccessControlList_IsOwner]  DEFAULT ((0)),
 CONSTRAINT [PK_AccessControlList] PRIMARY KEY CLUSTERED 
(
	[AccessControlListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AccessPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccessPermission](
	[AccessControlListId] [bigint] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[Deny] [bit] NOT NULL CONSTRAINT [DF_AccessPermission_Deny]  DEFAULT ((0)),
 CONSTRAINT [PK_AccessPermission] PRIMARY KEY CLUSTERED 
(
	[AccessControlListId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AuthClient]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthClient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuthClient](
	[AuthClientId] [varchar](128) NOT NULL,
	[Secret] [varchar](1000) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ApplicationType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [varchar](100) NULL,
	[AccessTokenExpireTimeSpan] [int] NOT NULL CONSTRAINT [DF_AuthClient_TokenLifeTime]  DEFAULT ((30)),
 CONSTRAINT [PK_dbo.AuthClients] PRIMARY KEY CLUSTERED 
(
	[AuthClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[PermissionId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefreshToken]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RefreshToken](
	[RefreshTokenId] [varchar](128) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[AuthClientId] [varchar](128) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [varchar](8000) NOT NULL,
	[UserAuthTokenId] [varchar](36) NULL,
 CONSTRAINT [PK_dbo.RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[RefreshTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resource](
	[ResourceId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Resource_ResourceId]  DEFAULT (newid()),
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Resource_IsActive]  DEFAULT ((1)),
	[Created] [datetime] NOT NULL CONSTRAINT [DF_Resource_Created]  DEFAULT (getdate()),
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ResourcePermission](
	[ResourcePermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[Deny] [bit] NOT NULL CONSTRAINT [DF_ResourcePermission_Deny]  DEFAULT ((0)),
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_ResourcePermission] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Role_IsActive]  DEFAULT ((1)),
	[UpdatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Enabled] [bit] NOT NULL CONSTRAINT [DF_User_Enabled]  DEFAULT ((1)),
	[Created] [datetime] NOT NULL CONSTRAINT [DF_User_Created]  DEFAULT (getdate()),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthToken]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAuthToken](
	[UserAuthTokenId] [varchar](36) NOT NULL CONSTRAINT [DF_UserAuthToken_UserAuthTokenId]  DEFAULT (replace(CONVERT([varchar](36),newid()),'-','')),
	[UserId] [bigint] NOT NULL,
	[AuthClientId] [varchar](128) NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[AccessToken] [varchar](8000) NULL,
	[IsLoggedIn] [bit] NOT NULL CONSTRAINT [DF_UserAuthToken_IsLoggedIn]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_UpdatedDate]  DEFAULT (getdate()),
	[IsExpired]  AS (case when [ExpiresUtc]<getutcdate() OR [IsLoggedIn]=(0) then (1) else (0) end),
 CONSTRAINT [PK_UserAuthToken] PRIMARY KEY CLUSTERED 
(
	[UserAuthTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserLoginProvider](
	[LoginProvider] [varchar](50) NOT NULL,
	[ProviderKey] [varchar](128) NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_UserLoginProvider] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[AccessPermissionJoin]	
WITH SCHEMABINDING
AS
     SELECT A.AccessControlListId,
            A.[ResourceId],
            A.[SecurityId],
            AP.PermissionId,
            AP.[Deny],
            P.Name
     FROM [dbo].AccessControlList A
          INNER JOIN [dbo].AccessPermission AP ON A.AccessControlListId = AP.AccessControlListId
          INNER JOIN [dbo].Permission P ON AP.PermissionId = P.PermissionId;


' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'PK_AccessPermissionJoin')
CREATE UNIQUE CLUSTERED INDEX [PK_AccessPermissionJoin] ON [dbo].[AccessPermissionJoin]
(
	[AccessControlListId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccessPermissionAllowDenyJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionAllowDenyJoin]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[AccessPermissionAllowDenyJoin]	  
WITH SCHEMABINDING
AS SELECT A.[ResourceId], A.[SecurityId] AS [AllowedSecurityId], A.PermissionId, D.[SecurityId] AS [DeniedSecurityId]
   FROM
   (
	   SELECT AP.ResourceId, AP.SecurityId, AP.PermissionId
	   FROM dbo.AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 0
   ) AS A
   LEFT OUTER JOIN
   (
	   SELECT AP.[ResourceId], AP.[SecurityId], AP.PermissionId
	   FROM [dbo].AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 1
   ) AS D
   ON A.[ResourceId] = D.[ResourceId] AND 
	  A.PermissionId = D.PermissionId;


' 
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceAccess]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[GetResourceAccess] (
	@SIDs dbo.SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS TABLE
AS
RETURN (
	   SELECT ResourceId
	   FROM dbo.AccessPermissionAllowDenyJoin AS AP
		   INNER JOIN @SIDs AS A ON AP.AllowedSecurityId = A.SecurityId
		   LEFT OUTER JOIN @SIDs AS D ON AP.DeniedSecurityId = D.SecurityId
	   WHERE AP.PermissionId = @PermissionId
		    AND D.SecurityId IS NULL
	   GROUP BY ResourceId
	   );

' 
END

GO
/****** Object:  View [dbo].[UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]'))
EXEC dbo.sp_executesql @statement = N'

CREATE    VIEW [dbo].[UserRoleSecurityId] 
WITH SCHEMABINDING
AS
     SELECT U.SecurityId AS UserSecurityId,
            R.SecurityId AS RoleSecurityId,
            U.UserId
     FROM dbo.[User] U
          INNER JOIN dbo.UserRole UR ON U.UserId = UR.UserId
          INNER JOIN dbo.[Role] R ON UR.RoleId = R.RoleId;





' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]') AND name = N'IX_UserRoleSecurityId')
CREATE UNIQUE CLUSTERED INDEX [IX_UserRoleSecurityId] ON [dbo].[UserRoleSecurityId]
(
	[UserId] ASC,
	[UserSecurityId] ASC,
	[RoleSecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserSecurityIdRelatedSecurityIds]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserSecurityIdRelatedSecurityIds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[GetUserSecurityIdRelatedSecurityIds]
(@userSecurityId UNIQUEIDENTIFIER
)
RETURNS TABLE
AS
     RETURN
(
    -- User
    SELECT @userSecurityId AS SecurityId,
           ''User'' AS SecurityIdType
    UNION ALL
    -- Users''s Roles
    SELECT RoleSecurityId,
           ''User Role''
    FROM [dbo].UserRoleSecurityId
    WHERE UserSecurityId = @userSecurityId
);

' 
END

GO
/****** Object:  View [dbo].[ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[ResourceOwnerRole]
WITH SCHEMABINDING
AS
SELECT
	ACL.ResourceId,
	R.RoleId,
	R.SecurityId,
	R.Name
FROM
	dbo.AccessControlList ACL
	INNER JOIN dbo.[Role] R ON ACL.SecurityId = R.SecurityId
WHERE
	ACL.IsOwner = 1


' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]') AND name = N'PK_ResourceOwnerRole')
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerRole] ON [dbo].[ResourceOwnerRole]
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ResourceOwnerUser] 
WITH SCHEMABINDING
 
AS
SELECT
	ACL.ResourceId,
	U.UserID,
	U.SecurityId,
	U.Username
FROM
	dbo.AccessControlList ACL
	INNER JOIN dbo.[User] U ON ACL.SecurityId = U.SecurityId
WHERE
	ACL.IsOwner = 1





' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]') AND name = N'PK_ResourceOwnerUser')
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerUser] ON [dbo].[ResourceOwnerUser]
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceOwner]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceOwner]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[GetResourceOwner] 
(	
	@ResourceId UNIQUEIDENTIFIER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		''U'' AS [Type],
		UserId AS [Id],
		SecurityId AS [SecurityId],
		Username AS [Name]
	FROM	dbo.ResourceOwnerUser WITH (NOEXPAND) WHERE ResourceId = @ResourceId
	UNION ALL
	SELECT
		''R'',
		RoleId,
		SecurityId,
		Name
	FROM dbo.ResourceOwnerRole WITH (NOEXPAND) WHERE ResourceId = @ResourceId
)

' 
END

GO
/****** Object:  View [dbo].[ResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceAccess]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ResourceAccess]
AS
     SELECT B.SecurityId,
            B.ResourceId,
            A.Name AS ResourceName,
            B.AccessControlListId,
            C.PermissionId,
            D.Name AS PermissionName,
            C.[Deny]
     FROM dbo.[Resource] AS A
          INNER JOIN [dbo].AccessControlList AS B ON(A.ResourceId = B.ResourceId)
          INNER JOIN [dbo].AccessPermission AS C ON B.AccessControlListId = C.AccessControlListId
          INNER JOIN [dbo].Permission AS D ON C.PermissionId = D.PermissionId;

' 
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND name = N'IX_AccessControlList')
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccessControlList] ON [dbo].[AccessControlList]
(
	[ResourceId] ASC,
	[SecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND name = N'IX_ResourcePermission')
CREATE NONCLUSTERED INDEX [IX_ResourcePermission] ON [dbo].[ResourcePermission]
(
	[ResourcePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User')
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermission_ResourceIdDeny]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermission_ResourceIdDeny')
CREATE NONCLUSTERED INDEX [IX_AccessPermission_ResourceIdDeny] ON [dbo].[AccessPermissionJoin]
(
	[ResourceId] ASC,
	[Deny] ASC
)
INCLUDE ( 	[Name],
	[PermissionId],
	[SecurityId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermissionJoin_PermissionResourceId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_PermissionResourceId')
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [dbo].[AccessPermissionJoin]
(
	[PermissionId] ASC,
	[ResourceId] ASC
)
INCLUDE ( 	[SecurityId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermissionJoin_SecurityIdPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_SecurityIdPermission')
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [dbo].[AccessPermissionJoin]
(
	[Deny] ASC,
	[SecurityId] ASC,
	[PermissionId] ASC
)
INCLUDE ( 	[ResourceId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission]  WITH CHECK ADD  CONSTRAINT [FK_AccessPermission_AccessControlList] FOREIGN KEY([AccessControlListId])
REFERENCES [dbo].[AccessControlList] ([AccessControlListId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] CHECK CONSTRAINT [FK_AccessPermission_AccessControlList]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission]  WITH CHECK ADD  CONSTRAINT [FK_AccessPermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] CHECK CONSTRAINT [FK_AccessPermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[RefreshToken]'))
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_AuthClient] FOREIGN KEY([AuthClientId])
REFERENCES [dbo].[AuthClient] ([AuthClientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[RefreshToken]'))
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_AuthClient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission]  WITH CHECK ADD  CONSTRAINT [FK_ResourcePermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] CHECK CONSTRAINT [FK_ResourcePermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission]  WITH CHECK ADD  CONSTRAINT [FK_ResourcePermission_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([ResourceId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] CHECK CONSTRAINT [FK_ResourcePermission_Resource]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Role]'))
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Role]'))
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAuthToken]'))
ALTER TABLE [dbo].[UserAuthToken]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthToken_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAuthToken]'))
ALTER TABLE [dbo].[UserAuthToken] CHECK CONSTRAINT [FK_UserAuthToken_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]'))
ALTER TABLE [dbo].[UserLoginProvider]  WITH CHECK ADD  CONSTRAINT [FK_UserLoginProvider_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]'))
ALTER TABLE [dbo].[UserLoginProvider] CHECK CONSTRAINT [FK_UserLoginProvider_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewUser] AS' 
END
GO

ALTER PROCEDURE [dbo].[AddNewUser] (
	@UserName VARCHAR(50)
	,@EmailAddress VARCHAR(50)
	,@Password VARCHAR(50)
	,@Enabled BIT = 1
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.[User] u
			WHERE u.[Username] = @UserName
				OR u.[EmailAddress] = @UserName
			)
	BEGIN
		DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID();

		INSERT INTO [dbo].[User] (
			[SecurityId]
			,[Username]
			,[Password]
			,[EmailAddress]
			,[Enabled]
			,[Created]
			)
		VALUES (
			@SecurityId
			,@UserName
			,@Password
			,@EmailAddress
			,@Enabled
			,GETDATE()
			);

		SELECT CAST(SCOPE_IDENTITY() AS BigINT) AS UserId;
	END;
	ELSE
	BEGIN
		DECLARE @name VARCHAR(150) = @UserName;
		IF (ISNULL(@EmailAddress, '') <> '') 
           BEGIN 
		  Set @name = (@name + ' / ' + @EmailAddress);
           END

		RAISERROR (45120, 16, 1, @name)
	END
END;

GO
/****** Object:  StoredProcedure [dbo].[AddNewUserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUserLoginProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddNewUserLoginProvider] AS' 
END
GO

ALTER PROCEDURE [dbo].[AddNewUserLoginProvider] (
	@UserId BIGINT
	,@LoginProvider VARCHAR(50)
	,@ProviderKey VARCHAR(128)
	)
AS
BEGIN
	INSERT INTO [dbo].[UserLoginProvider] (
		[LoginProvider]
		,[ProviderKey]
		,[UserId]
		)
	VALUES (
		@LoginProvider
		,@ProviderKey
		,@UserId
		)
END;


GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddRefreshToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[AddRefreshToken] (
     @RefreshTokenId VARCHAR(128)
	,@Username VARCHAR(50)
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@ProtectedTicket VARCHAR(8000)
	,@UserAuthTokenId VARCHAR(36)
	)
AS
BEGIN	 
	INSERT INTO [dbo].[RefreshToken] (
		[RefreshTokenId]
		,[Username]
		,[AuthClientId]
		,[IssuedUtc]
		,[ExpiresUtc]
		,[ProtectedTicket]
		,[UserAuthTokenId]
		)
	VALUES (
		@RefreshTokenId
		,@Username
		,@AuthClientId
		,@IssuedUtc
		,@ExpiresUtc
		,@ProtectedTicket
		,@UserAuthTokenId
		)

	SELECT @RefreshTokenId AS RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [dbo].[AddUserToRoleByName]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddUserToRoleByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddUserToRoleByName] AS' 
END
GO

ALTER PROCEDURE [dbo].[AddUserToRoleByName]
(
	@Username varchar(50),
	@Rolename varchar(50)
)	
AS
	DECLARE @UserId int;
	DECLARE @RoleId int;

	SELECT @UserId = UserId FROM dbo.[User] WHERE Username = @Username;
	SELECT @RoleId = RoleId FROM dbo.[Role] WHERE Name = @Rolename;

	IF NOT EXISTS(SELECT 1 FROM dbo.[UserRole] WHERE UserId = @UserId AND RoleID = @RoleId)
	BEGIN
		INSERT dbo.[UserRole] (UserID, RoleID) VALUES (@UserID, @RoleID);
	END




GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUsernamePassword]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthenticateUsernamePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AuthenticateUsernamePassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[AuthenticateUsernamePassword](@Username VARCHAR(50),
                                                     @Password VARCHAR(50))
AS
     BEGIN
         --DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50));

         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM dbo.[User] AS U
         WHERE U.Username = @Username
               AND U.[Password] = @Password
               AND U.[Enabled] = 1;

         --INSERT INTO @GroupList (RoleId, SecurityId, [Name])
         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM dbo.[Role] AS r
              INNER JOIN dbo.UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN dbo.[User] AS u ON u.UserId = ur.UserId
         WHERE u.Username = @Username
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM dbo.[User] AS U
              INNER JOIN dbo.[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.Username = @Username
               AND U.[Enabled] = 1;
     END;

GO
/****** Object:  StoredProcedure [dbo].[CheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckAuthorization]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CheckAuthorization] AS' 
END
GO

ALTER PROCEDURE [dbo].[CheckAuthorization] (
	@ResourceId UNIQUEIDENTIFIER
	,@SecurityIdList dbo.SecurityIdList READONLY
	,@PermissionId INT
	)
AS
BEGIN
	DECLARE @IsOwner BIT = 0
	DECLARE @DenyCount INT = 0;
	DECLARE @AllowCount INT = 0;
	DECLARE @ExpandedSecurityIdList dbo.SecurityIdList;

	INSERT INTO @ExpandedSecurityIdList
	SELECT [SecurityId]
	FROM @SecurityIdLIST
	
	UNION
	
	SELECT [SecurityId]
	FROM dbo.[Role]
	WHERE NAME = 'Anonymous';

	--Owner->Deny->Allow->Nothing
	IF EXISTS (SELECT TOP 1 1 FROM dbo.GetResourceOwner(@ResourceId) o INNER JOIN @ExpandedSecurityIdList s ON o.[SecurityId] = s.[SecurityId])	
	BEGIN
		SELECT @IsOwner = 1
	END
	ELSE
	BEGIN
		SELECT @DenyCount = COUNT(*)
		FROM @ExpandedSecurityIdList AS [SecurityIds]
		INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
			AND AP.ResourceId = @ResourceId
			AND AP.PermissionId = @PermissionId
			AND [Deny] = 1;

		IF @DenyCount = 0
		BEGIN
			SELECT @AllowCount = COUNT(*)
			FROM @ExpandedSecurityIdList AS [SecurityIds]
			INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
				AND AP.ResourceId = @ResourceId
				AND AP.PermissionId = @PermissionId
				AND [Deny] = 0;
		END;
	END;

	--RETURN VALUE IS A BIT FIELD
	--None = 0x0, 
	--Access = 0x1
	DECLARE @RetVal INT = 0;

	IF @IsOwner = 1 OR (@DenyCount = 0 AND @AllowCount > 0)
	BEGIN
		SET @RetVal = 1;
	END;

	SELECT @RetVal;
END;



GO
/****** Object:  StoredProcedure [dbo].[FindAuthClientById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindAuthClientById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FindAuthClientById] AS' 
END
GO

ALTER PROCEDURE [dbo].[FindAuthClientById] @authClientId VARCHAR(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT [AuthClientId]
		,[Secret]
		,[Name]
		,[ApplicationType]
		,[IsActive]
		,[RefreshTokenLifeTime]
		,[AllowedOrigin]
		,[AccessTokenExpireTimeSpan]
	FROM [dbo].[AuthClient] ac
	WHERE ac.[AuthClientId] = @authClientId;
END;

GO
/****** Object:  StoredProcedure [dbo].[FindLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindLoginProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FindLoginProvider] AS' 
END
GO
ALTER PROCEDURE [dbo].[FindLoginProvider] @loginProvider VARCHAR(50),
                                           @providerKey   VARCHAR(128)
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from
         -- interfering with SELECT statements.
         SET NOCOUNT ON;
         DECLARE @userId BIGINT;
         DECLARE @username varchar(50);
         SET @userId =
         (
             SELECT [UserId]
             FROM [dbo].[UserLoginProvider] ulp
             WHERE ulp.LoginProvider = @loginProvider
                   AND ulp.ProviderKey = @providerKey
         ); 
	    SET @username =
         (
             SELECT [Username]
             FROM [dbo].[User] u
             WHERE u.UserId = @userId
         );
         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM dbo.[User] AS U
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM dbo.[Role] AS r
              INNER JOIN dbo.UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN dbo.[User] AS u ON u.UserId = ur.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM dbo.[User] AS U
              INNER JOIN dbo.[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;
     END;

GO
/****** Object:  StoredProcedure [dbo].[FindRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FindRefreshToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[FindRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	SELECT rt.[RefreshTokenId]
		,rt.[Username]
		,rt.[AuthClientId]
		,rt.[IssuedUtc]
		,rt.[ExpiresUtc]
		,rt.[ProtectedTicket]
		,rt.[UserAuthTokenId]
	FROM [dbo].[RefreshToken] rt
	WHERE rt.RefreshTokenId = @RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [dbo].[GenerateUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenerateUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GenerateUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[GenerateUserAuthToken] (
	@Username VARCHAR(50)
	,@CheckExistence BIT = 0
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36) = NULL

	SET @userId = (SELECT UserId FROM [dbo].[User] u WHERE u.Username = @Username)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [dbo].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId

			DELETE rt FROM [dbo].[RefreshToken] rt 
			Inner Join [dbo].[UserAuthToken] uat on uat.UserAuthTokenId = rt.UserAuthTokenId 
			WHERE UserId = @userId
		END

		IF (@CheckExistence = 1)
		BEGIN
			IF EXISTS (SELECT TOP 1 1 FROM [dbo].[UserAuthToken] uat WHERE uat.UserId = @userId AND uat.IsExpired = 0)
			BEGIN
				SELECT @authTokenReturn UserAuthToken;
				RETURN;
			END
		END

		SET @authTokenReturn = (SELECT REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''));	

		INSERT INTO [dbo].[UserAuthToken] (
			UserAuthTokenId
			,UserId
			,IssuedUtc
			,ExpiresUtc
			,IsLoggedIn
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			);
	END

	SELECT @authTokenReturn UserAuthTokenId;
END;


GO
/****** Object:  StoredProcedure [dbo].[GetAllRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAllRefreshToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[GetAllRefreshToken]
AS
BEGIN
	SELECT [RefreshTokenId]
		,[Username]
		,[AuthClientId]
		,[IssuedUtc]
		,[ExpiresUtc]
		,[ProtectedTicket]
		,[UserAuthTokenId]
	FROM [dbo].[RefreshToken]
END;


GO
/****** Object:  StoredProcedure [dbo].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAuthenticatedUser] AS' 
END
GO
ALTER   PROCEDURE [dbo].[GetAuthenticatedUser](@UserId BIGINT)
AS
     BEGIN
         --DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50)); 
         DECLARE @username varchar(50);
	    SET @username =
         (
             SELECT [Username]
             FROM [dbo].[User] u
             WHERE u.UserId = @userId
         );

         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM dbo.[User] AS U
         WHERE U.[UserId] = @UserId
               AND U.[Enabled] = 1;

         --INSERT INTO @GroupList (RoleId, SecurityId, [Name])
         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM dbo.[Role] AS r
              INNER JOIN dbo.UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN dbo.[User] AS u ON u.UserId = ur.UserId
         WHERE u.[UserId] = @UserId
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM dbo.[User] AS U
              INNER JOIN dbo.[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.[UserId] = @UserId
               AND U.[Enabled] = 1;

	   EXECUTE dbo.[GetUserAuthTokenId] @Username
     END;

GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[GetUserAuthToken] (
	@UserId BIGINT
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]
		,uat.[IssuedUtc]
		,uat.[ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
	FROM dbo.UserAuthToken uat
	WHERE uat.UserId = @UserId
		AND uat.AccessToken = @AccessToken
END;


GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUserAuthTokenById] AS' 
END
GO

ALTER PROCEDURE [dbo].[GetUserAuthTokenById] (@UserAuthTokenId VARCHAR(36))
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]
		,uat.[IssuedUtc]
		,uat.[ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
	FROM dbo.UserAuthToken uat
	WHERE uat.[UserAuthTokenId] = @UserAuthTokenId
END;

GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenId]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUserAuthTokenId] AS' 
END
GO

ALTER PROCEDURE [dbo].[GetUserAuthTokenId] (
	@Username VARCHAR(50)
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36)

	SET @userId = (
			SELECT UserId
			FROM [dbo].[User] u
			WHERE u.Username = @Username
			)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [dbo].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId
		END

		SET @authTokenReturn = (SELECT REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''));

		INSERT INTO [dbo].[UserAuthToken] (
			UserAuthTokenId
			,UserId
			,IssuedUtc
			,ExpiresUtc
			,IsLoggedIn
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			);
	END

	SELECT @authTokenReturn UserAuthTokenId;
END;


GO
/****** Object:  StoredProcedure [dbo].[ListSecurityRolesByUserName]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListSecurityRolesByUserName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ListSecurityRolesByUserName] AS' 
END
GO
ALTER PROCEDURE [dbo].[ListSecurityRolesByUserName](@UserName VARCHAR(50))
AS
     SELECT R.RoleID,
            R.SecurityId,
            R.Name
     FROM dbo.[Role] R
          INNER JOIN dbo.[UserRole] UR ON R.RoleId = UR.RoleId
          INNER JOIN dbo.[User] U ON UR.UserId = U.UserId
     WHERE U.Username = @UserName;



GO
/****** Object:  StoredProcedure [dbo].[RemoveRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[RemoveRefreshToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[RemoveRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	DELETE
	FROM [dbo].[RefreshToken]
	WHERE RefreshTokenId = @RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [dbo].[RoleExists]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[RoleExists] AS' 
END
GO

ALTER PROCEDURE [dbo].[RoleExists]
(
	@RoleName varchar(50)
)
AS
	SELECT CAST(1 as bit) FROM dbo.[Role] WHERE Name = @RoleName




GO
/****** Object:  StoredProcedure [dbo].[SaveUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SaveUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [dbo].[SaveUserAuthToken] (
     @UserAuthTokenId varchar(50)
	,@UserId BIGINT
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.UserAuthToken uat
			WHERE uat.UserAuthTokenId = @UserAuthTokenId
			)
	BEGIN
		INSERT INTO dbo.UserAuthToken (
			UserId
			,AuthClientId
			,IssuedUtc
			,ExpiresUtc
			,AccessToken
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@UserId
			,@AuthClientId
			,@IssuedUtc
			,@ExpiresUtc
			,@AccessToken
			,GETDATE()
			,GETDATE()
			);
	END
	ELSE IF EXISTS (
			SELECT TOP 1 1
			FROM dbo.UserAuthToken uat
			WHERE uat.UserId = @UserId
				AND uat.AccessToken IS NULL
			)
	BEGIN
		UPDATE dbo.UserAuthToken
		SET AuthClientId = @AuthClientId
			,IssuedUtc = @IssuedUtc
			,ExpiresUtc = @ExpiresUtc
			,AccessToken = @AccessToken
			,UpdatedDate = GETDATE()
			,IsLoggedIn = 1
		WHERE UserAuthTokenId = @UserAuthTokenId
	END
	ELSE
	BEGIN
		DECLARE @error varchar(100);
		SET @error = CAST(@UserId AS VARCHAR(100));
		RAISERROR( N'The specified value %s already exists.', 16, 1, @error );
	END
END;


GO
/****** Object:  StoredProcedure [dbo].[SetTokenExpires]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetTokenExpires]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SetTokenExpires] AS' 
END
GO

ALTER PROCEDURE [dbo].[SetTokenExpires]
	-- Add the parameters for the stored procedure here
	@UserId BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	UPDATE dbo.UserAuthToken
	SET AccessToken = NULL
		,ExpiresUtc = GETUTCDATE()
		,IsLoggedIn = 0
		,UpdatedDate = GETDATE()
	WHERE [UserId] = @UserId

	SELECT @@ROWCOUNT
END


GO
/****** Object:  StoredProcedure [dbo].[spGetUserPermissions]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserPermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetUserPermissions] AS' 
END
GO

ALTER PROCEDURE [dbo].[spGetUserPermissions] (@userID INT)
AS
BEGIN
	WITH AllSecurityId
	AS (
		SELECT [User].[SecurityId]
		FROM dbo.[User]
		WHERE [User].UserID = @userID
		
		UNION
		
		SELECT [Role].[SecurityId]
		FROM dbo.[UserRole]
		INNER JOIN dbo.[Role] ON UserRole.RoleID = [Role].RoleID
		WHERE UserRole.UserID = @userID
		)
		,AllRResourceId
	AS (
		SELECT r.Name
			,ap.PermissionId
			,ap.[Deny]
			,acl.IsOwner
		FROM AllSecurityId asi	 
		INNER JOIN dbo.AccessControlList acl ON asi.SecurityId = acl.SecurityId
		INNER JOIN dbo.AccessPermission ap ON acl.AccessControlListId  = ap.AccessControlListId
		INNER JOIN dbo.[Resource] r ON acl.ResourceId = r.ResourceId
		)
	SELECT DISTINCT [Name] AS ResourceName
		,PermissionId AS PermissionId
	FROM AllRResourceId
	WHERE [Deny] = 0;
END;



GO
/****** Object:  StoredProcedure [dbo].[spGetUserResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserResourcePermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetUserResourcePermission] AS' 
END
GO

-- =============================================
ALTER PROCEDURE [dbo].[spGetUserResourcePermission] (@SIDList dbo.SecurityIdList READONLY)
AS
BEGIN
	SET NOCOUNT ON;

	WITH PERM (RID, PermissionId, DenyId, AllowId)
	AS (
		SELECT apadj.ResourceId
			,apadj.PermissionId
			,ISNULL(COUNT(SD.SecurityId), 0) DenyID
			,ISNULL(COUNT(AllowedSecurityId), 0) AllowId
		FROM [dbo].AccessPermissionAllowDenyJoin apadj
		INNER JOIN @SIDList SA ON apadj.AllowedSecurityId = SA.SecurityId
		LEFT OUTER JOIN @SIDList SD ON apadj.DeniedSecurityId = SD.SecurityId
		GROUP BY apadj.ResourceId
			,apadj.PermissionId
		)

	SELECT r.[Name] AS ResourceName
		,PM.PermissionId
	FROM PERM PM
	INNER JOIN dbo.[Resource] r WITH (NOLOCK) ON PM.RID = r.ResourceId
	WHERE PM.DenyID = 0
		AND PM.AllowId > 0
END


GO
/****** Object:  StoredProcedure [dbo].[spGrantPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGrantPermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGrantPermission] AS' 
END
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will grant permission to the specified resource
*
* Example Usage: EXEC Config.spGrantPermission '<RID GUID>', '<SID GUID>', -3
*
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
ALTER PROCEDURE [dbo].[spGrantPermission]
	@resourceId UNIQUEIDENTIFIER,
	@securityId UNIQUEIDENTIFIER,
	@permissionId INT,
	@isOwner BIT = 0
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE			
		@rowsAffected INT = 2,
		@SIDList dbo.SecurityIdList

    INSERT INTO @SIDList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to add it again
	IF Config.fnCheckAuthorization(@resourceId, @SIDList, @permissionId) = 0
	BEGIN
		INSERT INTO dbo.AccessControlList (ResourceId, SecurityId, IsOwner) VALUES (@resourceId, @securityId, @isOwner)
		SET @rowsAffected = @@ROWCOUNT
		INSERT INTO dbo.AccessPermission (AccessControlListId, PermissionId, [Deny]) VALUES (SCOPE_IDENTITY(), @permissionId, 0)
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, 'Config.spGrantPermission')
END TRY

BEGIN CATCH
	-- Error handling here
	DECLARE @errNumber int, @errSeverity int, @errState int, @errProcedure varchar(500), @errLine int, @errMmessage varchar(500)
	SELECT @errNumber = ERROR_NUMBER(), @errSeverity = ERROR_SEVERITY(), @errState = ERROR_STATE(), @errProcedure = ERROR_PROCEDURE(), @errLine = ERROR_LINE(), @errMmessage = ERROR_MESSAGE()

	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION 
	THROW
END CATCH

IF @@TRANCOUNT > 0 COMMIT TRANSACTION 



GO
/****** Object:  StoredProcedure [dbo].[spRevokePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRevokePermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRevokePermission] AS' 
END
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will revoke the permission for a resource (ResourceId) from the user or group
* represented by the specified securityId
*
* Example Usage: EXEC [dbo].[spRevokePermission] '<resourceId GUId>', '<securityId GUId>', -3
* 
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
ALTER PROCEDURE [dbo].[spRevokePermission]
	@resourceId UNIQUEIdENTIFIER,
	@securityId UNIQUEIdENTIFIER,
	@permissionId INT
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE	
		@rowsAffected INT = 2,
		@accessControlListId INT,
		@securityIdList dbo.SecurityIdList

    INSERT INTO @securityIdList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to revoke it
	IF Config.fnCheckAuthorization(@resourceId, @securityIdList, @permissionId) = 1
	BEGIN
		SET @AccessControlListId = (SELECT A.AccessControlListId FROM dbo.AccessControlList A INNER JOIN dbo.AccessPermission B ON B.AccessControlListId = A.AccessControlListId WHERE A.ResourceId = @resourceId AND A.SecurityId = @securityId AND B.PermissionId = @permissionId)

		DELETE dbo.AccessPermission WHERE AccessControlListId = @accessControlListId AND PermissionId = @permissionId
		SET @rowsAffected = @@ROWCOUNT
		DELETE dbo.AccessControlList WHERE AccessControlListId = @accessControlListId
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, 'Config.spRevokePermission')
END TRY

BEGIN CATCH
	-- Error handling here
	DECLARE @errNumber int, @errSeverity int, @errState int, @errProcedure varchar(500), @errLine int, @errMmessage varchar(500)
	SELECT @errNumber = ERROR_NUMBER(), @errSeverity = ERROR_SEVERITY(), @errState = ERROR_STATE(), @errProcedure = ERROR_PROCEDURE(), @errLine = ERROR_LINE(), @errMmessage = ERROR_MESSAGE()

	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION 

	THROW
END CATCH

IF @@TRANCOUNT > 0 COMMIT TRANSACTION 




GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AccessControlList', N'COLUMN',N'SecurityId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Either User.SecurityId or Role.SecurityId.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccessControlList', @level2type=N'COLUMN',@level2name=N'SecurityId'
GO
