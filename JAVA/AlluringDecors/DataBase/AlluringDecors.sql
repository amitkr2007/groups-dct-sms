USE [AlluringDecors]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tiitle] [nvarchar](150) NULL,
	[Content] [nvarchar](350) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PostDate] [datetime] NULL,
	[IsReplied] [bit] NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) NULL,
	[Answer] [nvarchar](350) NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FAQ] ON
INSERT [dbo].[FAQ] ([ID], [Question], [Answer]) VALUES (1, N'I am not a registered user? Will I be able to apply for the service?', N'No, only the registered users will be able to apply for the service.')
INSERT [dbo].[FAQ] ([ID], [Question], [Answer]) VALUES (2, N'I reside at a location "X", will I be provided with the service?', N'First you must apply for the service mentioning the service and the domain interested in, and the address at which you want the service to be provided. Then we will get back to you whether we will provide the service at that location or not.
(OR)
You can provide an answer stating that the service will be provided at so and so locations only.
')
INSERT [dbo].[FAQ] ([ID], [Question], [Answer]) VALUES (3, N'Will I be provided in any other services apart from the services and domains displayed? And if yes, what will be the charges?', N'Well it will be dependant on the type of the service and the domain you requested. We will revert back to you once the service request is received by us. The charges will be based on the service and the domain you preferred. This will be communicated well in advance before accepting and going ahead with the service.')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
/****** Object:  Table [dbo].[DomainList]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomainList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_DomainList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DomainList] ON
INSERT [dbo].[DomainList] ([ID], [Name]) VALUES (1, N'Decorating the House')
INSERT [dbo].[DomainList] ([ID], [Name]) VALUES (8, N'Decorating the Offices ')
INSERT [dbo].[DomainList] ([ID], [Name]) VALUES (9, N'Decoration of the Halls')
INSERT [dbo].[DomainList] ([ID], [Name]) VALUES (10, N'Decoration of the Restaurants ')
SET IDENTITY_INSERT [dbo].[DomainList] OFF
/****** Object:  Table [dbo].[CompanyInformation]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NULL,
	[CompanyDescription] [ntext] NULL,
	[ServiceDescription] [ntext] NULL,
	[BriefCompanyDescription] [nvarchar](350) NULL,
	[BriefServiceDescription] [nvarchar](350) NULL,
	[PreferExplanation] [ntext] NULL,
 CONSTRAINT [PK_CompanyInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyInformation] ON
INSERT [dbo].[CompanyInformation] ([ID], [Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription], [PreferExplanation]) VALUES (4, N'149 To Hien Thanh, P.13, Q.10, Tp. HCM', N'(08) 3979 7459', N'<div class="cnnExplainer cnn_html_slideshow">
<div class="cnnstrylccimg640">
<div class="cnn_stryichgfull">
<div class="cnn_stryichgflg">
<div><strong>STORY HIGHLIGHTS</strong></div>
<div class="cnnArticleGalleryPhotoContainer" style="text-align: left;">
<div class="cnn_strylftcntnt">
<div class="cnn_strylctcntr">
<ul class="cnn_bulletbin cnnStryHghLght">
    <li>Chelsea take on Bayern Munich in the final of the Champions League</li>
    <li>Bayern Munich will enjoy home advantage as final is hosted at Allianz Arena</li>
    <li>Both clubs have drastically different ownership models</li>
    <li>Chelsea is owned by a Russian billionaire; Bayern majority by the fans</li>
</ul>
<p>&nbsp;</p>
</div>
</div>
</div>
<div class="cnnArticleGalleryPhotoContainer" style="text-align: center;"><img border="0" width="640" height="360" src="http://i2.cdn.turner.com/cnn/dam/assets/120517041802-allianz-arena-17-5-12-horizontal-gallery.jpg" alt="The host venue for Saturday''s Champions League final, Bayern Munich''s Allianz Arena, has a capacity of 69,000 that the German club sells out for every match." id="articleGalleryPhoto001" style="margin:0 auto;" />&nbsp;</div>
<div class="cnnArticleGalleryPhotoContainer" style="text-align: center;">&nbsp;</div>
</div>
</div>
</div>
</div>
<p><strong>(CNN)</strong> -- When Chelsea and Bayern Munich walk out  onto the pitch at the Allianz Arena for Saturday''s European Champions  League final, it will mark the culmination of a competition rightly  regarded as the finest -- and the hardest to win -- in club football.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph2">Some of the greatest  teams in the world have fallen by the wayside in race for the prize:  Jose Mourinho''s Real Madrid and Alex Ferguson''s Manchester United, to  name but two. It was also the last bow for Pep Guardiola, arguably the  greatest coach in charge of the greatest team of the modern era, who  left Barcelona shortly after Champions League semifinal defeat against  Chelsea.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph3">But it is much more than a  match between the two best teams in Europe. It is also a clash of ideas  over how football should best be run, and whether money and the success  that statistically follows should trump the interests of the  supporters.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph4"><a href="http://edition.cnn.com/2012/05/18/sport/football/football-champions-league-bayern-chelsea/index.html?hpt=hp_c2#stats" target="_blank">Bayern vs. Chelsea: Click here to see the finalists'' vital statistics</a></p>
<p class="cnn_storypgraphtxt cnn_storypgraph5">On one hand you have  Chelsea, a club which has benefited most from the financial liberalism  of English football, an economic boom that followed the breakaway of the  English Premier League two decades ago.</p>', N'<div class="cnn_stryimg640captioned"><img border="0" width="640" height="360" src="http://i2.cdn.turner.com/cnn/dam/assets/120518052223-ukraine-yanokovych-story-top.jpg" alt="Splendid isolation: Will President Viktor Yanukovych greet any European dignitaries at Euro 2012?" /></div>
<div class="cnn_stryimg640caption">
<div class="cnn_strycaptiontxt">Splendid isolation: Will President Viktor Yanukovych greet any European dignitaries at Euro 2012?</div>
</div>
<p><a name="em0"></a></p>
<div class="cnn_strylftcntnt">
<div class="cnn_strylctcntr">
<div><strong>STORY HIGHLIGHTS</strong></div>
<ul class="cnn_bulletbin cnnStryHghLght">
    <li>Abundance of plots for novels from Ukrainian politics, says author Andrey Kurkov</li>
    <li>In-fighting between major political parties has trampled Ukraine</li>
    <li>Despite being in prison Yulia Tymoshenko still dominates foreign relations with Ukraine</li>
</ul>
</div>
</div>
<p class="cnnEditorialNote"><em><strong>Editor''s note:</strong> Andrey  Kurkov was born in St Petersburg in 1961. Having graduated from the Kiev  Foreign Languages Institute, he worked as a journalist, did his  military service as a prison warden in Odessa, then became a cameraman,  writer of screenplays and author. His books are published in English by <a href="http://www.randomhouse.co.uk/search/?searchTerm=kurkov" target="_blank">Harvill Secker</a> in the UK and <a href="http://mhpbooks.com/?s=kurkov" target="_blank">Meville House </a>in the U.S.</em></p>
<p><strong>(CNN)</strong> -- If democracy had existed in ancient Egypt, then not a single pyramid would not have been built.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph2">All because free people  in democratic countries will only agree to build pyramids for good  wages, and good wages are incompatible with a luxurious lifestyle of the  Pharaohnic family. But if the country has no Pharaoh then it will not  cross anybody''s mind to build pyramids.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph3">If &quot;Ukrainian democracy&quot;  had existed in ancient Egypt then the pyramids would not have been  built, not only because of a lack of money for salaries but also because  of the ordinary theft of half of the funds allocated for their  construction.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph4">I''m not actually a big  proponent of building pyramids. But &quot;Ukrainian democracy&quot;, I like it.  What is more, it feeds me. Not in the sense that it provides some kind  of social security and promises a good retirement. No! With enviable  regularity &quot;Ukrainian democracy&quot; feeds me with plots for novels, as well  as offering so many potential fictional heroes that no one writer could  fit it all in even if he writes two thick novels in a year.</p>
<div class="cnn_strylftcntnt">
<div class="cnn_strylctcntr cnn_strylccimg214"><img border="0" width="214" height="122" src="http://i2.cdn.turner.com/cnn/dam/assets/120518043951-andrey-kurkov-left-tease.jpg" alt="Andrey Kurkov" class="box-image" />
<div>Andrey Kurkov</div>
</div>
</div>
<p class="cnn_storypgraphtxt cnn_storypgraph5">Therefore because of a  lack of enough lifetime to write hundreds of novels, I have to write  some of the real-life stories just like this, in short articles.</p>
<div class="cnn_strylftcntnt">
<div class="cnn_strylctcntr cnn_strylctcquote">
<div class="cnn_strylctcqcntr">
<div>Ukrainian democracy feeds me with plots for novels and so many  potential fictional heroes that no one writer could fit it all in.<br />
<span>Andrey Kurkov</span></div>
</div>
</div>
</div>
<p class="cnn_storypgraphtxt cnn_storypgraph6">The presidency of Viktor  Yanukovych started in 2010 with a slogan: &quot;We are building a new  country&quot;. Billboards with the slogan decorated all the country''s cities,  villages and roads. So, everyone understands that major construction  work is starting, which means that smaller signs of the kind that adorn  building sites will soon appear, reading: &quot;Sorry for the inconvenience.&quot;</p>
<p class="cnn_storypgraphtxt cnn_storypgraph7">Anyway the construction  boom first started in the capital, Kiev. On the hills overlooking the  Dnieper River work began on a presidential helipad and overpass leading  to the government quarter in the city. At the same time work began on a  helipad near the mountain at the summit of which is buried national  Ukrainian poet Taras Shevchenko, a hundred kilometers from Kiev.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph8">They said that from now  on for the effective use of time of the head of state the president will  only go and see the grave of the great poet by helicopter.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph9">The helipads having not been completed the country set about <a href="http://edition.cnn.com/2012/05/08/sport/football/football-euro-2012-ukraine-tymoshenko/index.html">building stadiums for Euro 2012</a>  to be held in just a month, new airport terminals in the cities where  matches will take place and, of course, set about the repair of the  roads on which hundreds of thousands of fans from Western Europe will  doubtless travel on when they come to Ukraine.</p>', N'Some of the greatest teams in the world have fallen by the wayside in race for the prize: Jose Mourinho''s Real Madrid and Alex Ferguson''s Manchester United, to name but two. It was also the last bow for Pep Guardiola, arguably the greatest coach in charge of the greatest team of the modern era,...', N'The presidency of Viktor Yanukovych started in 2010 with a slogan: "We are building a new country". Billboards with the slogan decorated all the country''s cities, villages and roads. So, everyone understands that major construction work is starting, which means that smaller signs of the kind...', N'<div class="cnn_strylftcntnt">
<div class="cnn_strylctcntr">
<div><strong>STORY HIGHLIGHTS</strong></div>
<ul class="cnn_bulletbin cnnStryHghLght">
    <li>The deal the U.S. and China made over Chen Guangcheng appears to be unraveling</li>
    <li>Yang Su: Has the Obama administration bungled his case?</li>
    <li>He says the deal was almost made to be broken because the U.S. made false assumptions</li>
    <li>Su: U.S. will have more success in negotiating with China if it recruits more Chinese experts</li>
</ul>
</div>
</div>
<p class="cnnEditorialNote"><em><strong>Editor''s note:</strong> Yang Su is an associate professor of sociology at University of California, Irvine.</em></p>
<p><strong>(CNN)</strong> -- The Chinese dissident Chen Guangcheng''s  daring and extraordinary escape to the U.S. embassy in Beijing has  captivated the world. At first, it appeared that U.S. diplomats and the  Chinese government brokered a deal that satisfied Chen and everyone  involved. But now Chen says he wants to leave China, and that he feels  unsafe.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph2">Has the Obama  administration bungled his case? Did President Barack Obama use people  who were capable of correctly interpreting the signals in China? Or was  there a gap in translation?</p>
<p class="cnn_storypgraphtxt cnn_storypgraph3"><a href="http://edition.cnn.com/2012/05/04/world/asia/china-activist-us/index.html?hpt=hp_t2">Possible breakthrough for blind activist</a></p>
<p class="cnn_storypgraphtxt cnn_storypgraph4">We learned earlier this  week that Chen was released from the U.S. Embassy with the Chinese  government''s assurance of his &quot;safety&quot; and a promise to facilitate his  study of law in an unspecified place outside his home province of  Shandong. It sounded like a win-win solution. But those who have  intimate knowledge of China and its political system had reasons to  worry.</p>
<p class="cnn_storypgraphtxt cnn_storypgraph5">In many ways, the deal  was almost made to be broken, because it was based on three erroneous  assumptions on the part of American officials.</p>')
SET IDENTITY_INSERT [dbo].[CompanyInformation] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Sex] [bit] NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (2, N'2', N'client1', N'123', N'client1', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (3, N'Administrator', N'a', N'a', N'a', N'a', N'a', N'a', CAST(0x000A96E800000000 AS DateTime), 1, CAST(0x0000A05700000000 AS DateTime))
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (18, N'Administrator', N'binhtran', N'123456', N'Binh Tran', N'Binh Tran', N'Binh Tran', N'fd', CAST(0x000A96E800000000 AS DateTime), 1, CAST(0x0000A05900000000 AS DateTime))
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (19, N'Client', N'binh1', N'123456', N'Binh Tao', N'Binh Tao', N'Binh Tao', N'b@gmail.com', CAST(0x000A96E800000000 AS DateTime), 1, CAST(0x0000A05900000000 AS DateTime))
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (22, N'Client', N'binhtran', N'a', N'a', N'a', N'a', N'b@gmail.com', CAST(0x0000A05A00000000 AS DateTime), 1, CAST(0x0000A05A00000000 AS DateTime))
INSERT [dbo].[Users] ([ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]) VALUES (40, N'Client', N'', N'', N'', N'', N'', N'', CAST(0x0000A05A00000000 AS DateTime), 1, CAST(0x0000A05A00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[usp_Users_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Users_Update]
	@ID Int, @Role NVarChar(max), @UserName NVarChar(max), @Password NVarChar(max), @Name NVarChar(max), @Address NVarChar(max), @Phone NVarChar(max), @Email NVarChar(max), @Birthday DateTime, @Sex Bit, @StartDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[Users] SET [Role] = @Role, [UserName] = @UserName, [Password] = @Password, [Name] = @Name, [Address] = @Address, [Phone] = @Phone, [Email] = @Email, [Birthday] = @Birthday, [Sex] = @Sex, [StartDate] = @StartDate
WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Users_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]
FROM [dbo].[Users]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Users_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Users_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate]
FROM [dbo].[Users]

/*StoredProcedure [dbo].[usp_Users_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Users_Insert]
	@Role NVarChar(max), @UserName NVarChar(max), @Password NVarChar(max), @Name NVarChar(max), @Address NVarChar(max), @Phone NVarChar(max), @Email NVarChar(max), @Birthday DateTime, @Sex Bit, @StartDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Users] ([Role], [UserName], [Password], [Name], [Address], [Phone], [Email], [Birthday], [Sex], [StartDate])
VALUES (@Role, @UserName, @Password, @Name, @Address, @Phone, @Email, @Birthday, @Sex, @StartDate)

/*StoredProcedure [dbo].[usp_Users_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Users_CheckForLogin]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Users_CheckForLogin]
	@username varchar(max), @password varchar(max)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT *
FROM [dbo].[Users] AS users
WHERE users.UserName = @username AND users.Password = @password
GO
/****** Object:  StoredProcedure [dbo].[usp_FeedBacks_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FeedBacks_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Tiitle], [Content], [FullName], [Email], [PostDate], [IsReplied]
FROM [dbo].[FeedBacks]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_FeedBacks_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_FeedBacks_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FeedBacks_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FeedBacks_Insert]
	@Tiitle NVarChar(max), @Content NVarChar(max), @FullName NVarChar(max), @Email NVarChar(max), @PostDate DateTime, @IsReplied Bit
AS
SET NOCOUNT ON
INSERT INTO [dbo].[FeedBacks] ([Tiitle], [Content], [FullName], [Email], [PostDate], [IsReplied])
VALUES (@Tiitle, @Content, @FullName, @Email, @PostDate, @IsReplied)

/*StoredProcedure [dbo].[usp_FeedBacks_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_FeedBacks_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FAQ_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FAQ_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FAQ_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FAQ_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_FAQ_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_DomainList_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_DomainList_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_DomainList_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_DomainList_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_DomainList_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_CompanyInformation_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_Update]
	@ID Int, @Address NVarChar(max), @Phone NVarChar(max), @CompanyDescription NVarChar(max), @ServiceDescription NVarChar(max), @BriefCompanyDescription NVarChar(max), @BriefServiceDescription NVarChar(max), @PreferExplanation ntext
AS
SET NOCOUNT ON
UPDATE [dbo].[CompanyInformation] SET [Address] = @Address, [Phone] = @Phone, [CompanyDescription] = @CompanyDescription, [ServiceDescription] = @ServiceDescription, [BriefCompanyDescription] = @BriefCompanyDescription, [BriefServiceDescription] = @BriefServiceDescription, PreferExplanation = @PreferExplanation
WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyInformation_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription], PreferExplanation
FROM [dbo].[CompanyInformation]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_CompanyInformation_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyInformation_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT [ID], [Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription], PreferExplanation
FROM [dbo].[CompanyInformation]

/*StoredProcedure [dbo].[usp_CompanyInformation_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyInformation_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_Insert]
	@Address NVarChar(max), @Phone NVarChar(max), @CompanyDescription NVarChar(max), @ServiceDescription NVarChar(max), @BriefCompanyDescription NVarChar(max), @BriefServiceDescription NVarChar(max), @PreferExplanation ntext
AS
SET NOCOUNT ON
INSERT INTO [dbo].[CompanyInformation] ([Address], [Phone], [CompanyDescription], [ServiceDescription], [BriefCompanyDescription], [BriefServiceDescription], PreferExplanation)
VALUES (@Address, @Phone, @CompanyDescription, @ServiceDescription, @BriefCompanyDescription, @BriefServiceDescription, @PreferExplanation)

/*StoredProcedure [dbo].[usp_CompanyInformation_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyInformation_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyInformation_Delete]
	@ID Int
AS
SET NOCOUNT ON
DELETE FROM [dbo].[CompanyInformation]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_CompanyInformation_Update]*/
SET ANSI_NULLS ON
GO
/****** Object:  Table [dbo].[Replies]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDFeedBack] [int] NULL,
	[ReplyContent] [ntext] NULL,
	[ReplyName] [nvarchar](50) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [PK_Replies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesOffered]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesOffered](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDomainList] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Description] [ntext] NULL,
	[BriefDescription] [nvarchar](350) NULL,
	[Image] [nvarchar](150) NULL,
 CONSTRAINT [PK_ServicesOffered] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServicesOffered] ON
INSERT [dbo].[ServicesOffered] ([ID], [IDDomainList], [Name], [Price], [Description], [BriefDescription], [Image]) VALUES (27, 1, N'CBA', 333, N'<p><a href="http://www.newerahd.com/partners/homedecorators2/index.php?p_t=bestsellers&amp;show=bestsellers"><img alt="" src="http://www.newerahd.com/partners/homedecorators2/bulletlist.jpg" /></a>               <a href="http://www.newerahd.com/partners/homedecorators2/index.php?p_t=txtcontent&amp;show=photoupload"><img alt="" style="width:298px; margin-top:10px;" src="http://www.newerahd.com/partners/homedecorators2/hdc_index_photoupload_banner.jpg" /></a>               			   			  <img width="10" height="10" alt="" src="http://www.homedecorators.com/images/media/classification/cat_subcat/trans_spacer.gif" /></p><p>Updating your walls with custom framed art specifically                      tailored to your needs will really make an impact on your space.                       Use the resources top designers use for fine art.</p><p><strong>Find the image you love.</strong><br /><strong>Create the size you want.</strong><br /><strong>Specify canvas or paper.</strong><br /><strong>Frame it with the moulding of your choice.</strong></p><p>This is our collection of limited edition artwork, the finest  available.  Each image in this exclusive collection is signed and  numbered out of an edition of 950 prints and reproduced to the exact  standards of the artist who created the original.  This breathtaking  collection is made with the finest materials and will last a lifetime.  We offer the most affordable price available, a fraction of the cost  that you would receive at an art gallery or custom frame shop.</p><p style="">Get started now. Create customized artwork like a top designer.  Beautiful contemporary or traditional looks for your walls has  never been easier or more affordable.   Your room deserves the best!</p><p>&nbsp;</p>', N'This is our collection of limited edition artwork, the finest available. Each image in this exclusive collection is signed and numbered out of an edition of 950 prints and reproduced to the exact standards of the artist who created the original. This...', N'1337437503718.jpg')
INSERT [dbo].[ServicesOffered] ([ID], [IDDomainList], [Name], [Price], [Description], [BriefDescription], [Image]) VALUES (28, 1, N'AAA', 111, N'<div class="cnn_strylftcntnt"><div class="cnn_strylctcntr"><div><strong>STORY HIGHLIGHTS</strong></div><ul class="cnn_bulletbin cnnStryHghLght">    <li>Four Palestinian athletes will compete at the 2012 Olympics in London</li>    <li>Woroud Sawalha, 20, will take part in the women''s 800 meters event</li>    <li>Bahaa al-Farra, a 21-year-old from Gaza, will run in the men''s 400 meters</li>    <li>Al-Farra has no proper track to train on, and works out in a public gym</li></ul></div></div><p><strong>(CNN)</strong> -- Woroud Sawalha knows she won''t win a medal  at the London Olympics. She isn''t likely to get beyond the first round  of the 800 meters.</p><p class="cnn_storypgraphtxt cnn_storypgraph2">But for the 20-year-old and her three teammates, just competing under the Palestinian flag is a source of pride.</p><p class="cnn_storypgraphtxt cnn_storypgraph3">The appearance itself is  controversial: the U.N. does not recognize a Palestinian state but  athletes have been allowed to compete under a Palestinian flag by the  International Olympic Committee and soccer''s ruling body FIFA since 1996  and 1998 respectively.</p><p class="cnn_storypgraphtxt cnn_storypgraph4">&quot;It means a lot for me  that I am female and representing Palestine,&quot; she told CNN''s Aiming For  Gold. &quot;I will represent my hometown Asira ash-Shamaliya, Palestine and  my university.&quot;</p><p class="cnn_storypgraphtxt cnn_storypgraph5">Asira ash-Shamaliya is a  village of fewer than 10,000 inhabitants in the northern West Bank,  where protests and tear gas form part of everyday life in a region still  fighting for independence from Israel after two decades of struggle.</p><p class="cnn_storypgraphtxt cnn_storypgraph6">Sawalha, who will be  immediately recognizable by her black headscarf, long-sleeved top and  long trousers, knows that when she steps up to the line in London, she  won''t just be representing herself.</p>', N'The appearance itself is controversial: the U.N. does not recognize a Palestinian state but athletes have been allowed to compete under a Palestinian flag by the International Olympic Committee and soccer''s ruling body FIFA since 1996 and...', N'1337437644656.jpg')
SET IDENTITY_INSERT [dbo].[ServicesOffered] OFF
/****** Object:  Table [dbo].[ServiceRequests]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[RequestStatus] [nvarchar](50) NULL,
	[RequestDate] [datetime] NULL,
	[Location] [nvarchar](150) NULL,
	[PhoneLocation] [nvarchar](50) NULL,
	[MailLocation] [nvarchar](150) NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_ServiceRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceRequests] ON
INSERT [dbo].[ServiceRequests] ([ID], [IDUser], [RequestStatus], [RequestDate], [Location], [PhoneLocation], [MailLocation], [Note]) VALUES (3, 2, N'Request Received', CAST(0x0000A05700000000 AS DateTime), N'HCM', N'123', N'abc@gmail.com', N'Nothing')
SET IDENTITY_INSERT [dbo].[ServiceRequests] OFF
/****** Object:  Table [dbo].[ServiceRequestDetail]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDServiceRequest] [int] NULL,
	[IDServiceOffered] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[LocationRequest] [nvarchar](250) NULL,
 CONSTRAINT [PK_ServiceRequestDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestDetail] ON
INSERT [dbo].[ServiceRequestDetail] ([ID], [IDServiceRequest], [IDServiceOffered], [Quantity], [Price], [LocationRequest]) VALUES (5, 3, 27, 3, 333, N'HCM')
INSERT [dbo].[ServiceRequestDetail] ([ID], [IDServiceRequest], [IDServiceOffered], [Quantity], [Price], [LocationRequest]) VALUES (6, 3, 28, 1, 111, N'HCM')
SET IDENTITY_INSERT [dbo].[ServiceRequestDetail] OFF
/****** Object:  Table [dbo].[Bills]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDServiceRequest] [int] NULL,
	[DatePaid] [datetime] NULL,
	[TotalPaidAmount] [float] NULL,
	[BalanceAmount] [float] NULL,
	[DueAmount] [float] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON
INSERT [dbo].[Bills] ([ID], [IDServiceRequest], [DatePaid], [TotalPaidAmount], [BalanceAmount], [DueAmount]) VALUES (9, 3, CAST(0x0000A05700000000 AS DateTime), 1110, 0, 0)
SET IDENTITY_INSERT [dbo].[Bills] OFF
/****** Object:  Table [dbo].[Projects]    Script Date: 05/23/2012 08:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDServiceRequest] [int] NULL,
	[ProjectStatus] [nvarchar](50) NULL,
	[Name] [nvarchar](150) NULL,
	[Image] [nvarchar](150) NULL,
	[Description] [ntext] NULL,
	[BriefDescription] [nvarchar](350) NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Projects] ON
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (9, 3, N'Accomplished', N'ABC', N'1337605285300.jpg', N'<p><span style="color: rgb(102, 102, 102); font-family: ''Trebuchet MS'', Helvetica, Arial, Verdana, sans-serif; font-style: italic; ">The datepicker is tied to a standard form input field. Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay. Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as the input''s value.</span></p>', N'The datepicker is tied to a standard form input field. Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay. Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as...', CAST(0x0000A05800000000 AS DateTime))
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (10, 3, N'On-Going', N'ABC', N'', N'<p>&nbsp;<span style="color: rgb(102, 102, 102); font-family: ''Trebuchet MS'', Helvetica, Arial, Verdana, sans-serif; font-style: italic; ">The datepicker is tied to a standard form input field. Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay. Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as the input''s value.</span></p>', N'The datepicker is tied to a standard form input field. Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay. Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as the...', CAST(0x0000A05800000000 AS DateTime))
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (12, NULL, NULL, NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (13, 3, N'On-Going', N'abc', N'', N'<p>&nbsp;a</p>', N'aaa...', CAST(0x0000A05800000000 AS DateTime))
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (14, 3, N'On-Going', N'yui', N'', N'<p><span style="color: rgb(34, 34, 34); font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 16px; ">By default, the datepicker calendar opens in a small overlay onFocus and closes automatically onBlur or when a date is selected. For an inline calendar, simply attach the datepicker to a div or span.</span></p>', N'By default, the datepicker calendar opens in a small overlay onFocus and closes automatically onBlur or when a date is selected. For an inline calendar, simply attach the datepicker to a div or...', CAST(0x0000A05800000000 AS DateTime))
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (15, 3, N'On-Going', N'4gty', N'1337605487807.jpg', N'<p><span style="color: rgb(34, 34, 34); font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 16px; ">The jQuery UI Datepicker is a highly configurable plugin that adds datepicker functionality to your pages. You can customize the date format and language, restrict the selectable date ranges and add in buttons and other navigation options easily.</span></p>', N'The jQuery UI Datepicker is a highly configurable plugin that adds datepicker functionality to your pages. You can customize the date format and language, restrict the selectable date ranges and add in buttons and other navigation...', CAST(0x0000A05800000000 AS DateTime))
INSERT [dbo].[Projects] ([ID], [IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate]) VALUES (36, 3, N'On-Going', N'dddfgf', N'', N'<p>&nbsp;ddddddddddddddddddddddddddddddddddddd</p>', N'...', CAST(0x0000A05A00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Projects] OFF
/****** Object:  StoredProcedure [dbo].[usp_Replies_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Replies_SelectByIDFeedBack]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Replies_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Replies_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Replies_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Replies_Insert]
	@IDFeedBack Int, @ReplyContent NVarChar(max), @ReplyName NVarChar(max), @ReplyDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Replies] ([IDFeedBack], [ReplyContent], [ReplyName], [ReplyDate])
VALUES (@IDFeedBack, @ReplyContent, @ReplyName, @ReplyDate)

/*StoredProcedure [dbo].[usp_Replies_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Replies_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_Update]
	@ID Int, @IDDomainList Int, @Name NVarChar(max), @Price Float, @Description NVarChar(max), @BriefDescription NVarChar(max), @Image NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[ServicesOffered] SET [IDDomainList] = @IDDomainList, [Name] = @Name, [Price] = @Price, [Description] = @Description, [BriefDescription] = @BriefDescription, [Image] = @Image
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServicesOffered_SelectByIDDomainList]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_SelectByIDDomainList]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectByIDDomainList]
@IDDomainList Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image, domainlist.Name AS DomainlistName
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.IDDomainList = domainlist.ID AND servicesoffered.IDDomainList = @IDDomainList
GO
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image, domainlist.Name as DomainlistName
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.ID = @ID AND servicesoffered.IDDomainList = domainlist.ID

/*StoredProcedure [dbo].[usp_ServicesOffered_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicesoffered.ID, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image, domainlist.Name
FROM [dbo].[ServicesOffered] AS servicesoffered, [dbo].[DomainList] AS domainlist
WHERE servicesoffered.IDDomainList = domainlist.ID

/*StoredProcedure [dbo].[usp_ServicesOffered_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServicesOffered_Insert]
	@IDDomainList Int, @Name NVarChar(max), @Price Float, @Description NVarChar(max), @BriefDescription NVarChar(max), @Image NVarChar(max), @ID Int output
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServicesOffered] ([IDDomainList], [Name], [Price], [Description], [BriefDescription], [Image])
VALUES (@IDDomainList, @Name, @Price, @Description, @BriefDescription, @Image)

SET @ID = SCOPE_IDENTITY()

/*StoredProcedure [dbo].[usp_ServicesOffered_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServicesOffered_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Update]
	@ID Int, @IDUser Int, @RequestStatus NVarChar(max), @RequestDate DateTime, @Location NVarChar(max), @PhoneLocation NVarChar(max), @MailLocation NVarChar(max), @Note NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[ServiceRequests] SET [IDUser] = @IDUser, [RequestStatus] = @RequestStatus, [RequestDate] = @RequestDate, [Location] = @Location, [PhoneLocation] = @PhoneLocation, [MailLocation] = @MailLocation, [Note] = @Note
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectByIDUser]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_SelectByIDUser]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectByIDUser]
@IDUser Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, users.Role, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users
WHERE servicerequests.IDUser = users.ID AND servicerequests.IDUser = @IDUser
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, users.Role, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users
WHERE servicerequests.ID = @ID AND servicerequests.IDUser = users.ID

/*StoredProcedure [dbo].[usp_ServiceRequests_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequests.ID, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, users.Role, users.UserName, users.Password, users.Name, users.Address, users.Phone, users.Email, users.Birthday, users.Sex, users.StartDate
FROM [dbo].[ServiceRequests] AS servicerequests, [dbo].[Users] AS users
WHERE servicerequests.IDUser = users.ID

/*StoredProcedure [dbo].[usp_ServiceRequests_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Insert]
	@IDUser Int, @RequestStatus NVarChar(max), @RequestDate DateTime, @Location NVarChar(max), @PhoneLocation NVarChar(max), @MailLocation NVarChar(max), @Note NVarChar(max), @ID INT OUTPUT
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServiceRequests] ([IDUser], [RequestStatus], [RequestDate], [Location], [PhoneLocation], [MailLocation], [Note])
VALUES (@IDUser, @RequestStatus, @RequestDate, @Location, @PhoneLocation, @MailLocation, @Note)

SET @ID = SCOPE_IDENTITY()

/*StoredProcedure [dbo].[usp_ServiceRequests_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequests_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequests_Delete]
	@ID Int
AS
SET NOCOUNT ON

/* Delete Service Request Details */
DELETE FROM [dbo].[ServiceRequestDetail]
WHERE [IDServiceRequest] = @ID

/* Delete Service Request */
DELETE FROM [dbo].[ServiceRequests]
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequests_Update]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_Update]
	@ID Int, @IDServiceRequest Int, @IDServiceOffered Int, @Quantity Int, @Price Float, @LocationRequest NVarChar(max)
AS
SET NOCOUNT ON
UPDATE [dbo].[ServiceRequestDetail] SET [IDServiceRequest] = @IDServiceRequest, [IDServiceOffered] = @IDServiceOffered, [Quantity] = @Quantity, [Price] = @Price, [LocationRequest] = @LocationRequest
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceRequest]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Quantity, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID AND servicerequestdetail.IDServiceRequest = @IDServiceRequest

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceOffered]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByIDServiceOffered]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByIDServiceOffered]
@IDServiceOffered Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Quantity, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID AND servicerequestdetail.IDServiceOffered = @IDServiceOffered
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Quantity, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.ID = @ID AND servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT servicerequestdetail.ID, servicerequestdetail.IDServiceRequest, servicerequestdetail.IDServiceOffered, servicerequestdetail.Quantity, servicerequestdetail.Price, servicerequestdetail.LocationRequest, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note, servicesoffered.IDDomainList, servicesoffered.Name, servicesoffered.Price, servicesoffered.Description, servicesoffered.BriefDescription, servicesoffered.Image
FROM [dbo].[ServiceRequestDetail] AS servicerequestdetail, [dbo].[ServiceRequests] AS servicerequests, [dbo].[ServicesOffered] AS servicesoffered
WHERE servicerequestdetail.IDServiceRequest = servicerequests.ID AND servicerequestdetail.IDServiceOffered = servicesoffered.ID

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceRequestDetail_Insert]
	@IDServiceRequest Int, @IDServiceOffered Int, @Quantity Int, @Price Float, @LocationRequest NVarChar(max)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[ServiceRequestDetail] ([IDServiceRequest], [IDServiceOffered], [Quantity], [Price], [LocationRequest])
VALUES (@IDServiceRequest, @IDServiceOffered, @Quantity, @Price, @LocationRequest)

/*StoredProcedure [dbo].[usp_ServiceRequestDetail_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceRequestDetail_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Projects_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_Update]
	@ID Int, @IDServiceRequest Int, @ProjectStatus NVarChar(max), @Name NVarChar(max), @Image NVarChar(max), @Description NVarChar(max), @BriefDescription NVarChar(max), @StartDate DateTime
AS
SET NOCOUNT ON
UPDATE [dbo].[Projects] SET [IDServiceRequest] = @IDServiceRequest, [ProjectStatus] = @ProjectStatus, [Name] = @Name, [Image] = @Image, [Description] = @Description, [BriefDescription] = @BriefDescription, [StartDate] = @StartDate
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Projects_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_SelectByIDServiceRequest]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.ProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests
WHERE projects.IDServiceRequest = servicerequests.ID AND projects.IDServiceRequest = @IDServiceRequest
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_SelectByIDProjectStatus]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByIDProjectStatus]
@ProjectStatus nvarchar(max)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT *
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests
WHERE projects.IDServiceRequest = servicerequests.ID and projects.ProjectStatus = @ProjectStatus
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.ProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests
WHERE projects.ID = @ID AND projects.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Projects_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT projects.ID, projects.IDServiceRequest, projects.ProjectStatus, projects.Name, projects.Image, projects.Description, projects.BriefDescription, projects.StartDate, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Projects] AS projects, [dbo].[ServiceRequests] AS servicerequests
WHERE projects.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Projects_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Projects_Insert]
	@IDServiceRequest Int, @ProjectStatus NVarChar(max), @Name NVarChar(max), @Image NVarChar(max), @Description NVarChar(max), @BriefDescription NVarChar(max), @StartDate DateTime
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Projects] ([IDServiceRequest], [ProjectStatus], [Name], [Image], [Description], [BriefDescription], [StartDate])
VALUES (@IDServiceRequest, @ProjectStatus, @Name, @Image, @Description, @BriefDescription, @StartDate)

/*StoredProcedure [dbo].[usp_Projects_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Projects_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[usp_Bills_Update]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Bills_Update]
	@ID Int, @IDServiceRequest Int, @DatePaid DateTime, @TotalPaidAmount Float, @BalanceAmount Float, @DueAmount Float
AS
SET NOCOUNT ON
UPDATE [dbo].[Bills] SET [IDServiceRequest] = @IDServiceRequest, [DatePaid] = @DatePaid, [TotalPaidAmount] = @TotalPaidAmount, [BalanceAmount] = @BalanceAmount, [DueAmount] = @DueAmount
WHERE [ID] = @ID

/*StoredProcedure [dbo].[usp_Bills_SelectByIDServiceRequest]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Bills_SelectByIDServiceRequest]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectByIDServiceRequest]
@IDServiceRequest Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.TotalPaidAmount, bills.BalanceAmount, bills.DueAmount, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.IDServiceRequest = servicerequests.ID AND bills.IDServiceRequest = @IDServiceRequest
GO
/****** Object:  StoredProcedure [dbo].[usp_Bills_SelectByID]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectByID]
	@ID Int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.TotalPaidAmount, bills.BalanceAmount, bills.DueAmount, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.ID = @ID AND bills.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Bills_Insert]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Bills_SelectAll]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Bills_SelectAll]
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT bills.ID, bills.IDServiceRequest, bills.DatePaid, bills.TotalPaidAmount, bills.BalanceAmount, bills.DueAmount, servicerequests.IDUser, servicerequests.RequestStatus, servicerequests.RequestDate, servicerequests.Location, servicerequests.PhoneLocation, servicerequests.MailLocation, servicerequests.Note
FROM [dbo].[Bills] AS bills, [dbo].[ServiceRequests] AS servicerequests
WHERE bills.IDServiceRequest = servicerequests.ID

/*StoredProcedure [dbo].[usp_Bills_SelectByID]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Bills_Insert]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Bills_Insert]
	@IDServiceRequest Int, @DatePaid DateTime, @TotalPaidAmount Float, @BalanceAmount Float, @DueAmount Float
AS
SET NOCOUNT ON
INSERT INTO [dbo].[Bills] ([IDServiceRequest], [DatePaid], [TotalPaidAmount], [BalanceAmount], [DueAmount])
VALUES (@IDServiceRequest, @DatePaid, @TotalPaidAmount, @BalanceAmount, @DueAmount)

/*StoredProcedure [dbo].[usp_Bills_Delete]*/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_Bills_Delete]    Script Date: 05/23/2012 08:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  ForeignKey [FK_Bills_ServiceRequests]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_ServiceRequests] FOREIGN KEY([IDServiceRequest])
REFERENCES [dbo].[ServiceRequests] ([ID])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_ServiceRequests]
GO
/****** Object:  ForeignKey [FK_Projects_ServiceRequests]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_ServiceRequests] FOREIGN KEY([IDServiceRequest])
REFERENCES [dbo].[ServiceRequests] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_ServiceRequests]
GO
/****** Object:  ForeignKey [FK_Replies_FeedBacks]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD  CONSTRAINT [FK_Replies_FeedBacks] FOREIGN KEY([IDFeedBack])
REFERENCES [dbo].[FeedBacks] ([ID])
GO
ALTER TABLE [dbo].[Replies] CHECK CONSTRAINT [FK_Replies_FeedBacks]
GO
/****** Object:  ForeignKey [FK_ServiceRequestDetail_ServiceRequests]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[ServiceRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestDetail_ServiceRequests] FOREIGN KEY([IDServiceRequest])
REFERENCES [dbo].[ServiceRequests] ([ID])
GO
ALTER TABLE [dbo].[ServiceRequestDetail] CHECK CONSTRAINT [FK_ServiceRequestDetail_ServiceRequests]
GO
/****** Object:  ForeignKey [FK_ServiceRequestDetail_ServicesOffered]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[ServiceRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestDetail_ServicesOffered] FOREIGN KEY([IDServiceOffered])
REFERENCES [dbo].[ServicesOffered] ([ID])
GO
ALTER TABLE [dbo].[ServiceRequestDetail] CHECK CONSTRAINT [FK_ServiceRequestDetail_ServicesOffered]
GO
/****** Object:  ForeignKey [FK_ServiceRequests_Users]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[ServiceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequests_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ServiceRequests] CHECK CONSTRAINT [FK_ServiceRequests_Users]
GO
/****** Object:  ForeignKey [FK_ServicesOffered_DomainList]    Script Date: 05/23/2012 08:29:02 ******/
ALTER TABLE [dbo].[ServicesOffered]  WITH CHECK ADD  CONSTRAINT [FK_ServicesOffered_DomainList] FOREIGN KEY([IDDomainList])
REFERENCES [dbo].[DomainList] ([ID])
GO
ALTER TABLE [dbo].[ServicesOffered] CHECK CONSTRAINT [FK_ServicesOffered_DomainList]
GO
