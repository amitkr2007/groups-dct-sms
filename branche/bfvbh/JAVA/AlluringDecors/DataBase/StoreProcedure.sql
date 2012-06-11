USE [AlluringDecors]
GO
/*StoredProcedure [dbo].[usp_CompanyInformation_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_CompanyInformation_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_CompanyInformation_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription]
FROM [dbo].[CompanyInformation]

/*StoredProcedure [dbo].[usp_CompanyInformation_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_CompanyInformation_Insert' AND type = 'P')
	DROP PROCEDURE usp_CompanyInformation_Insert
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_Insert]
	@Address NVarChar(max), @Phone NVarChar(max), @CompanyDescription NVarChar(max), @ServiceDescription NVarChar(max), @BriefCompanyDescription NVarChar(max), @BriefServiceDescription NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[CompanyInformation] ([Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription])
VALUES (@Address, @Phone, @CompanyDescription, @ServiceDescription, @BriefCompanyDescription, @BriefServiceDescription)

/*StoredProcedure [dbo].[usp_FAQ_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FAQ_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_FAQ_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_FAQ_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Question], [Answer]
FROM [dbo].[FAQ]

/*StoredProcedure [dbo].[usp_FAQ_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FAQ_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_FAQ_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_FAQ_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Question], [Answer]
FROM [dbo].[FAQ]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_FAQ_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FAQ_Insert' AND type = 'P')
	DROP PROCEDURE usp_FAQ_Insert
GO
CREATE PROCEDURE [dbo].[usp_FAQ_Insert]
	@Question NVarChar(max), @Answer NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[FAQ] ([Question], [Answer])
VALUES (@Question, @Answer)

/*StoredProcedure [dbo].[usp_FAQ_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FAQ_Delete' AND type = 'P')
	DROP PROCEDURE usp_FAQ_Delete
GO
CREATE PROCEDURE [dbo].[usp_FAQ_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[FAQ]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_FAQ_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FAQ_Update' AND type = 'P')
	DROP PROCEDURE usp_FAQ_Update
GO
CREATE PROCEDURE [dbo].[usp_FAQ_Update]
	@ID Int, @Question NVarChar(max), @Answer NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[FAQ] SET [Question] = @Question, [Answer] = @Answer
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_FeedBacks_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FeedBacks_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_FeedBacks_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Tiitle], [Content], [FullName], [Email], [PostDate], [IsReplied]
FROM [dbo].[FeedBacks]

/*StoredProcedure [dbo].[usp_FeedBacks_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FeedBacks_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_FeedBacks_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT FeedBacks.ID, Tiitle, Content, FullName, Email, PostDate, IsReplied, ReplyName, ReplyContent
FROM FeedBacks left join Replies on IDFeedBack = FeedBacks.ID
WHERE FeedBacks.ID = @ID

/*StoredProcedure [dbo].[usp_FeedBacks_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FeedBacks_Insert' AND type = 'P')
	DROP PROCEDURE usp_FeedBacks_Insert
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_Insert]
	@Tiitle NVarChar(max), @Content NVarChar(max), @FullName NVarChar(max), @Email NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[FeedBacks] ([Tiitle], [Content], [FullName], [Email], [PostDate], [IsReplied])
VALUES (@Tiitle, @Content, @FullName, @Email, GETDATE(), 'false')

/*StoredProcedure [dbo].[usp_FeedBacks_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FeedBacks_Delete' AND type = 'P')
	DROP PROCEDURE usp_FeedBacks_Delete
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[FeedBacks]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_FeedBacks_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_FeedBacks_Update' AND type = 'P')
	DROP PROCEDURE usp_FeedBacks_Update
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_Update]
	@ID Int, @Tiitle NVarChar(max), @Content NVarChar(max), @FullName NVarChar(max), @Email NVarChar(max), @PostDate DateTime, @IsReplied Bit
AS
SET NOCOUNT ON
UPDATE [dbo].[FeedBacks] SET [Tiitle] = @Tiitle, [Content] = @Content, [FullName] = @FullName, [Email] = @Email, [PostDate] = @PostDate, [IsReplied] = @IsReplied
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Replies_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_Replies_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_Replies_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT replies.ID, replies.IDFeedBack, replies.ReplyContent, replies.ReplyName, replies.ReplyDate, feedbacks.Tiitle, feedbacks.Content, feedbacks.FullName, feedbacks.Email, feedbacks.PostDate, feedbacks.IsReplied
FROM [dbo].[Replies] AS replies, [dbo].[FeedBacks] AS feedbacks
WHERE replies.IDFeedBack = feedbacks.ID

/*StoredProcedure [dbo].[usp_Replies_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_Replies_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_Replies_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT replies.ID, replies.IDFeedBack, replies.ReplyContent, replies.ReplyName, replies.ReplyDate, feedbacks.Tiitle, feedbacks.Content, feedbacks.FullName, feedbacks.Email, feedbacks.PostDate, feedbacks.IsReplied
FROM [dbo].[Replies] AS replies, [dbo].[FeedBacks] AS feedbacks
WHERE replies.ID = @ID AND replies.IDFeedBack = feedbacks.ID

/*StoredProcedure [dbo].[usp_Replies_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_Insert' AND type = 'P')
	DROP PROCEDURE usp_Replies_Insert
GO
CREATE PROCEDURE [dbo].[usp_Replies_Insert]
	@IDFeedBack nvarchar(max), @ReplyContent NVarChar(max), @ReplyName NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Replies] ([IDFeedBack], [ReplyContent], [ReplyName], [ReplyDate])
VALUES (CONVERT(int, @IDFeedBack), @ReplyContent, @ReplyName, GETDATE())
update FeedBacks set IsReplied = 'true' where ID = @IDFeedBack

/*StoredProcedure [dbo].[usp_Replies_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_Delete' AND type = 'P')
	DROP PROCEDURE usp_Replies_Delete
GO
CREATE PROCEDURE [dbo].[usp_Replies_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[Replies]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Replies_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_Update' AND type = 'P')
	DROP PROCEDURE usp_Replies_Update
GO
CREATE PROCEDURE [dbo].[usp_Replies_Update]
	@ID Int, @IDFeedBack Int, @ReplyContent NVarChar(max), @ReplyName NVarChar(max), @ReplyDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[Replies] SET [IDFeedBack] = @IDFeedBack, [ReplyContent] = @ReplyContent, [ReplyName] = @ReplyName, [ReplyDate] = @ReplyDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Replies_SelectByIDFeedBack]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Replies_SelectByIDFeedBack' AND type = 'P')
	DROP PROCEDURE usp_Replies_SelectByIDFeedBack
GO
CREATE PROCEDURE [dbo].[usp_Replies_SelectByIDFeedBack]
@IDFeedBack Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT replies.ID, replies.IDFeedBack, replies.ReplyContent, replies.ReplyName, replies.ReplyDate, feedbacks.Tiitle, feedbacks.Content, feedbacks.FullName, feedbacks.Email, feedbacks.PostDate, feedbacks.IsReplied
FROM [dbo].[Replies] AS replies, [dbo].[FeedBacks] AS feedbacks
WHERE replies.IDFeedBack = feedbacks.ID AND replies.IDFeedBack = @IDFeedBack

/*StoredProcedure [dbo].[usp_Roles_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Roles_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_Roles_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_Roles_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[Roles]

/*StoredProcedure [dbo].[usp_Roles_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Roles_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_Roles_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_Roles_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[Roles]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Roles_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Roles_Insert' AND type = 'P')
	DROP PROCEDURE usp_Roles_Insert
GO
CREATE PROCEDURE [dbo].[usp_Roles_Insert]
	@Name NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Roles] ([Name])
VALUES (@Name)

/*StoredProcedure [dbo].[usp_Roles_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Roles_Delete' AND type = 'P')
	DROP PROCEDURE usp_Roles_Delete
GO
CREATE PROCEDURE [dbo].[usp_Roles_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[Roles]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Roles_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Roles_Update' AND type = 'P')
	DROP PROCEDURE usp_Roles_Update
GO
CREATE PROCEDURE [dbo].[usp_Roles_Update]
	@ID Int, @Name NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[Roles] SET [Name] = @Name
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Users_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_Users_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_Users_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT users.ID, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, roles.Name
FROM [dbo].[Users] AS users, [dbo].[Roles] AS roles
WHERE users.IDRole = roles.ID

/*StoredProcedure [dbo].[usp_Users_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_Users_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_Users_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT users.ID, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, roles.Name
FROM [dbo].[Users] AS users, [dbo].[Roles] AS roles
WHERE users.ID = @ID AND users.IDRole = roles.ID

/*StoredProcedure [dbo].[usp_Users_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_Insert' AND type = 'P')
	DROP PROCEDURE usp_Users_Insert
GO
CREATE PROCEDURE [dbo].[usp_Users_Insert]
	@IDRole Int, @UserName NVarChar(max), @Password NVarChar(max), @Name NVarChar(max), @Address NVarChar(max), @Phone NVarChar(max), @Email NVarChar(max), @Birthday DateTime, @Sex Bit, @StartDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Users] ([IDRole], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate])
VALUES (@IDRole, @UserName, @Password, @Name, @Address, @Phone, @Email, @Birthday, @Sex, @StartDate)

/*StoredProcedure [dbo].[usp_Users_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_Delete' AND type = 'P')
	DROP PROCEDURE usp_Users_Delete
GO
CREATE PROCEDURE [dbo].[usp_Users_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[Users]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Users_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_Update' AND type = 'P')
	DROP PROCEDURE usp_Users_Update
GO
CREATE PROCEDURE [dbo].[usp_Users_Update]
	@ID Int, @IDRole Int, @UserName NVarChar(max), @Password NVarChar(max), @Name NVarChar(max), @Address NVarChar(max), @Phone NVarChar(max), @Email NVarChar(max), @Birthday DateTime, @Sex Bit, @StartDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[Users] SET [IDRole] = @IDRole, [UserName] = @UserName, [Password] = @Password, [Name] = @Name, [Address] = @Address, [Phone] = @Phone, [Email] = @Email, [Birthday] = @Birthday, [Sex] = @Sex, [StartDate] = @StartDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Users_SelectByIDRole]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_SelectByIDRole' AND type = 'P')
	DROP PROCEDURE usp_Users_SelectByIDRole
GO
CREATE PROCEDURE [dbo].[usp_Users_SelectByIDRole]
@IDRole Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT users.ID, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, roles.Name
FROM [dbo].[Users] AS users, [dbo].[Roles] AS roles
WHERE users.IDRole = roles.ID AND users.IDRole = @IDRole

/*StoredProcedure [dbo].[usp_DomainList_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_DomainList_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_DomainList_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_DomainList_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[DomainList]

/*StoredProcedure [dbo].[usp_DomainList_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_DomainList_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_DomainList_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_DomainList_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[DomainList]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_DomainList_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_DomainList_Insert' AND type = 'P')
	DROP PROCEDURE usp_DomainList_Insert
GO
CREATE PROCEDURE [dbo].[usp_DomainList_Insert]
	@Name NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[DomainList] ([Name])
VALUES (@Name)

/*StoredProcedure [dbo].[usp_DomainList_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_DomainList_Delete' AND type = 'P')
	DROP PROCEDURE usp_DomainList_Delete
GO
CREATE PROCEDURE [dbo].[usp_DomainList_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[DomainList]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_DomainList_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_DomainList_Update' AND type = 'P')
	DROP PROCEDURE usp_DomainList_Update
GO
CREATE PROCEDURE [dbo].[usp_DomainList_Update]
	@ID Int, @Name NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[DomainList] SET [Name] = @Name
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServicesOffered_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, domainlist.Name
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.IDDomainList = domainlist.ID

/*StoredProcedure [dbo].[usp_ServicesOffered_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, domainlist.Name
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.ID = @ID AND servicesoffered.IDDomainList = domainlist.ID

/*StoredProcedure [dbo].[usp_ServicesOffered_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_Insert' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_Insert
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_Insert]
	@IDDomainList Int, @Name NVarChar(max), @Price Float
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServicesOffered] ([IDDomainList], [Name], [Price])
VALUES (@IDDomainList, @Name, @Price)

/*StoredProcedure [dbo].[usp_ServicesOffered_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_Delete' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_Delete
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[ServicesOffered]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServicesOffered_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_Update' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_Update
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_Update]
	@ID Int, @IDDomainList Int, @Name NVarChar(max), @Price Float
AS
SET NOCOUNT ON
UPDATE [dbo].[ServicesOffered] SET [IDDomainList] = @IDDomainList, [Name] = @Name, [Price] = @Price
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServicesOffered_SelectByIDDomainList]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServicesOffered_SelectByIDDomainList' AND type = 'P')
	DROP PROCEDURE usp_ServicesOffered_SelectByIDDomainList
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectByIDDomainList]
@IDDomainList Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, domainlist.Name
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.IDDomainList = domainlist.ID AND servicesoffered.IDDomainList = @IDDomainList

/*StoredProcedure [dbo].[usp_ShoppingCarts_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT shoppingcarts.ID, shoppingcarts.IDServiceOffered, shoppingcarts.CartID, shoppingcarts.CreateDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ShoppingCarts] AS shoppingcarts, [dbo].[ServicesOffered] AS servicesoffered
WHERE shoppingcarts.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ShoppingCarts_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT shoppingcarts.ID, shoppingcarts.IDServiceOffered, shoppingcarts.CartID, shoppingcarts.CreateDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ShoppingCarts] AS shoppingcarts, [dbo].[ServicesOffered] AS servicesoffered
WHERE shoppingcarts.ID = @ID AND shoppingcarts.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ShoppingCarts_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_Insert' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_Insert
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_Insert]
	@IDServiceOffered Int, @CartID NVarChar(max), @CreateDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ShoppingCarts] ([IDServiceOffered], [CartID], [CreateDate])
VALUES (@IDServiceOffered, @CartID, @CreateDate)

/*StoredProcedure [dbo].[usp_ShoppingCarts_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_Delete' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_Delete
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[ShoppingCarts]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ShoppingCarts_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_Update' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_Update
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_Update]
	@ID Int, @IDServiceOffered Int, @CartID NVarChar(max), @CreateDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[ShoppingCarts] SET [IDServiceOffered] = @IDServiceOffered, [CartID] = @CartID, [CreateDate] = @CreateDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ShoppingCarts_SelectByIDServiceOffered]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ShoppingCarts_SelectByIDServiceOffered' AND type = 'P')
	DROP PROCEDURE usp_ShoppingCarts_SelectByIDServiceOffered
GO
CREATE PROCEDURE [dbo].[usp_ShoppingCarts_SelectByIDServiceOffered]
@IDServiceOffered Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT shoppingcarts.ID, shoppingcarts.IDServiceOffered, shoppingcarts.CartID, shoppingcarts.CreateDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ShoppingCarts] AS shoppingcarts, [dbo].[ServicesOffered] AS servicesoffered
WHERE shoppingcarts.IDServiceOffered = servicesoffered.ID AND shoppingcarts.IDServiceOffered = @IDServiceOffered

/*StoredProcedure [dbo].[usp_ProjectStatus_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ProjectStatus_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_ProjectStatus_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_ProjectStatus_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[ProjectStatus]

/*StoredProcedure [dbo].[usp_ProjectStatus_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ProjectStatus_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_ProjectStatus_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_ProjectStatus_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[ProjectStatus]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ProjectStatus_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ProjectStatus_Insert' AND type = 'P')
	DROP PROCEDURE usp_ProjectStatus_Insert
GO
CREATE PROCEDURE [dbo].[usp_ProjectStatus_Insert]
	@Name NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ProjectStatus] ([Name])
VALUES (@Name)

/*StoredProcedure [dbo].[usp_ProjectStatus_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ProjectStatus_Delete' AND type = 'P')
	DROP PROCEDURE usp_ProjectStatus_Delete
GO
CREATE PROCEDURE [dbo].[usp_ProjectStatus_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[ProjectStatus]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ProjectStatus_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ProjectStatus_Update' AND type = 'P')
	DROP PROCEDURE usp_ProjectStatus_Update
GO
CREATE PROCEDURE [dbo].[usp_ProjectStatus_Update]
	@ID Int, @Name NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[ProjectStatus] SET [Name] = @Name
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Projects_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_Projects_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.IDProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, projectstatus.Name
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ProjectStatus] AS projectstatus
WHERE projects.IDServiceRequest = servicerequests.ID AND projects.IDProjectStatus = projectstatus.ID

/*StoredProcedure [dbo].[usp_Projects_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_Projects_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.IDProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, projectstatus.Name
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ProjectStatus] AS projectstatus
WHERE projects.ID = @ID AND projects.IDServiceRequest = servicerequests.ID AND projects.IDProjectStatus = projectstatus.ID

/*StoredProcedure [dbo].[usp_Projects_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_Insert' AND type = 'P')
	DROP PROCEDURE usp_Projects_Insert
GO
CREATE PROCEDURE [dbo].[usp_Projects_Insert]
	@IDServiceRequest Int, @IDProjectStatus Int, @Name NVarChar(max), @Image NVarChar(max), @Description NVarChar(max), @BriefDescription NVarChar(max), @StartDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Projects] ([IDServiceRequest], [IDProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate])
VALUES (@IDServiceRequest, @IDProjectStatus, @Name, @Image, @Description, @BriefDescription, @StartDate)

/*StoredProcedure [dbo].[usp_Projects_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_Delete' AND type = 'P')
	DROP PROCEDURE usp_Projects_Delete
GO
CREATE PROCEDURE [dbo].[usp_Projects_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[Projects]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Projects_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_Update' AND type = 'P')
	DROP PROCEDURE usp_Projects_Update
GO
CREATE PROCEDURE [dbo].[usp_Projects_Update]
	@ID Int, @IDServiceRequest Int, @IDProjectStatus Int, @Name NVarChar(max), @Image NVarChar(max), @Description NVarChar(max), @BriefDescription NVarChar(max), @StartDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[Projects] SET [IDServiceRequest] = @IDServiceRequest, [IDProjectStatus] = @IDProjectStatus, [Name] = @Name, [Image] = @Image, [Description] = @Description, [BriefDescription] = @BriefDescription, [StartDate] = @StartDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Projects_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_SelectByIDServiceRequest' AND type = 'P')
	DROP PROCEDURE usp_Projects_SelectByIDServiceRequest
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.IDProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, projectstatus.Name
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ProjectStatus] AS projectstatus
WHERE projects.IDServiceRequest = servicerequests.ID AND projects.IDProjectStatus = projectstatus.ID AND projects.IDServiceRequest = @IDServiceRequest

/*StoredProcedure [dbo].[usp_Projects_SelectByIDProjectStatus]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Projects_SelectByIDProjectStatus' AND type = 'P')
	DROP PROCEDURE usp_Projects_SelectByIDProjectStatus
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByIDProjectStatus]
@ProjectStatus nvarchar(max)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT *
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests
WHERE projects.IDServiceRequest = servicerequests.ID and projects.ProjectStatus = @ProjectStatus

/*StoredProcedure [dbo].[usp_RequestStatus_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_RequestStatus_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_RequestStatus_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_RequestStatus_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[RequestStatus]

/*StoredProcedure [dbo].[usp_RequestStatus_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_RequestStatus_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_RequestStatus_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_RequestStatus_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Name]
FROM [dbo].[RequestStatus]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_RequestStatus_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_RequestStatus_Insert' AND type = 'P')
	DROP PROCEDURE usp_RequestStatus_Insert
GO
CREATE PROCEDURE [dbo].[usp_RequestStatus_Insert]
	@ID Int, @Name NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[RequestStatus] ([ID], [Name])
VALUES (@ID, @Name)

/*StoredProcedure [dbo].[usp_RequestStatus_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_RequestStatus_Delete' AND type = 'P')
	DROP PROCEDURE usp_RequestStatus_Delete
GO
CREATE PROCEDURE [dbo].[usp_RequestStatus_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[RequestStatus]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_RequestStatus_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_RequestStatus_Update' AND type = 'P')
	DROP PROCEDURE usp_RequestStatus_Update
GO
CREATE PROCEDURE [dbo].[usp_RequestStatus_Update]
	@ID Int, @Name NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[RequestStatus] SET [Name] = @Name
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, requeststatus.Name
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users, [dbo].[RequestStatus] AS requeststatus
WHERE servicerequests.IDUser = users.ID AND servicerequests.IDRequestStatus = requeststatus.ID

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, requeststatus.Name
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users, [dbo].[RequestStatus] AS requeststatus
WHERE servicerequests.ID = @ID AND servicerequests.IDUser = users.ID AND servicerequests.IDRequestStatus = requeststatus.ID

/*StoredProcedure [dbo].[usp_ServiceRequests_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_Insert' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_Insert
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Insert]
	@IDUser Int, @IDRequestStatus Int, @RequestDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServiceRequests] ([IDUser], [IDRequestStatus], [RequestDate])
VALUES (@IDUser, @IDRequestStatus, @RequestDate)

/*StoredProcedure [dbo].[usp_ServiceRequests_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_Delete' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_Delete
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[ServiceRequests]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequests_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_Update' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_Update
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Update]
	@ID Int, @IDUser Int, @IDRequestStatus Int, @RequestDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[ServiceRequests] SET [IDUser] = @IDUser, [IDRequestStatus] = @IDRequestStatus, [RequestDate] = @RequestDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectByIDUser]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_SelectByIDUser' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_SelectByIDUser
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectByIDUser]
@IDUser Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, requeststatus.Name
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users, [dbo].[RequestStatus] AS requeststatus
WHERE servicerequests.IDUser = users.ID AND servicerequests.IDRequestStatus = requeststatus.ID AND servicerequests.IDUser = @IDUser

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectByIDRequestStatus]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequests_SelectByIDRequestStatus' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequests_SelectByIDRequestStatus
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectByIDRequestStatus]
@IDRequestStatus Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, users.IDRole, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate, requeststatus.Name
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users, [dbo].[RequestStatus] AS requeststatus
WHERE servicerequests.IDUser = users.ID AND servicerequests.IDRequestStatus = requeststatus.ID AND servicerequests.IDRequestStatus = @IDRequestStatus

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.ID = @ID AND servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_Insert' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_Insert
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_Insert]
	@IDServiceRequest Int, @IDServiceOffered Int, @Price Float, @LocationRequest NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServiceRequestDetail] ([IDServiceRequest], [IDServiceOffered], [Price], [LocationRequest])
VALUES (@IDServiceRequest, @IDServiceOffered, @Price, @LocationRequest)

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_Delete' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_Delete
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[ServiceRequestDetail]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_Update' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_Update
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_Update]
	@ID Int, @IDServiceRequest Int, @IDServiceOffered Int, @Price Float, @LocationRequest NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[ServiceRequestDetail] SET [IDServiceRequest] = @IDServiceRequest, [IDServiceOffered] = @IDServiceOffered, [Price] = @Price, [LocationRequest] = @LocationRequest
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_SelectByIDServiceRequest' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_SelectByIDServiceRequest
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID AND servicerequestdetail.IDServiceRequest = @IDServiceRequest

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceOffered]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_ServiceRequestDetail_SelectByIDServiceOffered' AND type = 'P')
	DROP PROCEDURE usp_ServiceRequestDetail_SelectByIDServiceOffered
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByIDServiceOffered]
@IDServiceOffered Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID AND servicerequestdetail.IDServiceOffered = @IDServiceOffered

/*StoredProcedure [dbo].[usp_Bills_SelectAll]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_SelectAll' AND type = 'P')
	DROP PROCEDURE usp_Bills_SelectAll
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.BalanceAmount, bills.DueAmount, bills.TotalPaidAmont, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Bills_SelectByID]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_SelectByID' AND type = 'P')
	DROP PROCEDURE usp_Bills_SelectByID
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.BalanceAmount, bills.DueAmount, bills.TotalPaidAmont, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.ID = @ID AND bills.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Bills_Insert]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_Insert' AND type = 'P')
	DROP PROCEDURE usp_Bills_Insert
GO
CREATE PROCEDURE [dbo].[usp_Bills_Insert]
	@IDServiceRequest Int, @DatePaid DateTime, @BalanceAmount Float, @DueAmount Float, @TotalPaidAmont Float
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Bills] ([IDServiceRequest], [DatePaid], [BalanceAmount], [DueAmount], [TotalPaidAmont])
VALUES (@IDServiceRequest, @DatePaid, @BalanceAmount, @DueAmount, @TotalPaidAmont)

/*StoredProcedure [dbo].[usp_Bills_Delete]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_Delete' AND type = 'P')
	DROP PROCEDURE usp_Bills_Delete
GO
CREATE PROCEDURE [dbo].[usp_Bills_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[Bills]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Bills_Update]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_Update' AND type = 'P')
	DROP PROCEDURE usp_Bills_Update
GO
CREATE PROCEDURE [dbo].[usp_Bills_Update]
	@ID Int, @IDServiceRequest Int, @DatePaid DateTime, @BalanceAmount Float, @DueAmount Float, @TotalPaidAmont Float
AS
SET NOCOUNT ON
UPDATE [dbo].[Bills] SET [IDServiceRequest] = @IDServiceRequest, [DatePaid] = @DatePaid, [BalanceAmount] = @BalanceAmount, [DueAmount] = @DueAmount, [TotalPaidAmont] = @TotalPaidAmont
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Bills_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Bills_SelectByIDServiceRequest' AND type = 'P')
	DROP PROCEDURE usp_Bills_SelectByIDServiceRequest
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.BalanceAmount, bills.DueAmount, bills.TotalPaidAmont, servicerequests.IDUser, servicerequests.IDRequestStatus, servicerequests.RequestDate
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.IDServiceRequest = servicerequests.ID AND bills.IDServiceRequest = @IDServiceRequest

/*StoredProcedure [dbo].[usp_Users_SelectByUsername]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'usp_Users_SelectByUsername' AND type = 'P')
	DROP PROCEDURE usp_Users_SelectByUsername
GO
CREATE PROCEDURE [dbo].[usp_Users_CheckForLogin]
	@username varchar(max), @password varchar(max)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT *
FROM [dbo].[Users] AS users
WHERE users.UserName = @username AND users.Password = @password
