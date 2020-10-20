USE [Taxis]
GO
/****** Object:  Table [dbo].[TripDetails] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tripId] [int] NULL,
	[latitude] [decimal](18, 15) NULL,
	[length] [decimal](18, 15) NULL,
	[distance] [decimal](10, 6) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_TripDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
    [typeId] [int] NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[createdDate] [datetime] NULL,
	[dni] [varchar](8) NOT NULL,	
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trip] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trip](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDriverId] [int] NULL,
	[userPassengerId] [int] NULL,
	[initialLatitude] [decimal](18, 15) NULL,
	[initialLength] [decimal](18, 15) NULL,
	[suggestedLatitude] [decimal](18, 15) NULL,
	[suggestedLength] [decimal](18, 15) NULL,
	[finalLatitude] [decimal](18, 15) NULL,
	[finalLength] [decimal](18, 15) NULL,
	[started_date] [datetime] NULL,
	[ended_date] [datetime] NULL,
	[distance] [decimal](10, 6) NULL,
	[total] [decimal](10, 2) NULL,
	[initialAddress] [varchar](100) NULL,
	[finalAddress] [varchar](100) NULL,
	[suggestedAddress] [varchar](100) NULL,
 CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[TripDetails]  WITH CHECK ADD  CONSTRAINT [FK_TripDetails_Trip] FOREIGN KEY([tripId])
REFERENCES [dbo].[Trip] ([id])
GO
ALTER TABLE [dbo].[TripDetails] CHECK CONSTRAINT [FK_TripDetails_Trip]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([typeId])
REFERENCES [dbo].[UserType] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_User] FOREIGN KEY([userDriverId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_User]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_User1] FOREIGN KEY([userPassengerId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_User1]
GO