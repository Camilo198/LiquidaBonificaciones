USE [ChevyplanApp]
GO

/****** Object:  Table [dbo].[CallDetailHist]    Script Date: 20/02/2020 9:01:55 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CallDetailHist](
	[CallStartDt] [datetime2](3) NOT NULL,
	[SeqNum] [int] NOT NULL,
	[CallId] [int] NOT NULL,
	[Service_Id] [int] NULL,
	[User_Id] [nvarchar](16) NULL,
	[CallTypeId] [int] NULL,
	[CallCategoryId] [int] NULL,
	[DialedNum] [nvarchar](40) NULL,
	[Station] [nvarchar](40) NULL,
	[NearOffHookDt] [datetime2](3) NULL,
	[FarOffHookDt] [datetime2](3) NULL,
	[NearOnHookDt] [datetime2](3) NULL,
	[FarOnHookDt] [datetime2](3) NULL,
	[BeginGaurdDt] [datetime2](3) NULL,
	[EndGaurdDt] [datetime2](3) NULL,
	[CallInsertDt] [datetime2](3) NULL,
	[ANI] [nvarchar](40) NULL,
	[DNIS] [nvarchar](40) NULL,
	[Site_Id] [int] NULL,
	[Switch_Id] [int] NULL,
	[ResourceGroup_Id] [int] NULL,
	[ResourceGroupType] [int] NULL,
	[Circuit_Id] [int] NULL,
	[ChannelId] [int] NULL,
	[InfoDigits] [nvarchar](40) NULL,
	[AgentSiteId] [int] NULL,
	[AgentSwitchId] [int] NULL,
	[DetailTable] [nvarchar](40) NULL,
	[CallerId] [nvarchar](40) NULL,
	[IPNIQNodeId] [int] NOT NULL CONSTRAINT [DF_CallDetail_IPNIQNodeId]  DEFAULT ((0)),
	[ContactTypeId] [int] NOT NULL CONSTRAINT [DF_CallDetail_ContactTypeId]  DEFAULT ((-1)),
	[LineNumber] [int] NOT NULL CONSTRAINT [DF_CallDetail_LineNumber]  DEFAULT ((-1)),
	[QueueTime] [int] NULL,
	[UMID] [varchar](36) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


