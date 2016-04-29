USE [s16guest37]
GO
/****** Object:  Table [dbo].[company]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[companyId] [int] NOT NULL,
	[companyName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [int] NOT NULL,
	[subscriptionId] [int] NOT NULL,
	[customerCompanyId] [int] NOT NULL,
	[customerPhoneId] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customerCompany]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customerCompany](
	[customerCompanyId] [int] NOT NULL,
	[customerCompanyName] [varchar](50) NOT NULL,
	[customerCompanyZipCode] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[customerCompanyStateId] [int] NOT NULL,
	[customerCompanyCityId] [int] NOT NULL,
	[customerCompanyCountryId] [int] NOT NULL,
	[customerCompanyStreetId] [int] NOT NULL,
 CONSTRAINT [PK_customerCompany] PRIMARY KEY CLUSTERED 
(
	[customerCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[developer]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[developer](
	[developerId] [int] NOT NULL,
	[devFirstName] [varchar](25) NOT NULL,
	[devLastName] [varchar](25) NOT NULL,
	[devDateOfBirth] [date] NOT NULL,
	[companyId] [int] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[developerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[developmentVersion]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[developmentVersion](
	[developmentVersionId] [int] NOT NULL,
	[developmentVersionNum] [int] NOT NULL,
	[developmentReleaseDate] [date] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_Development Version] PRIMARY KEY CLUSTERED 
(
	[developmentVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[platform]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platform](
	[platformId] [int] NOT NULL,
	[platformName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[platformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] NOT NULL,
	[productName] [varchar](30) NOT NULL,
	[productDescription] [varchar](1000) NOT NULL,
	[companyId] [int] NOT NULL,
	[platformId] [int] NOT NULL,
	[developerId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subscriptionCustomer]    Script Date: 4/28/2016 8:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subscriptionCustomer](
	[subscriptionId] [int] NOT NULL,
	[customerFirstName] [varchar](25) NOT NULL,
	[customerLastName] [varchar](25) NOT NULL,
	[customerEmail] [varchar](80) NOT NULL,
	[companyId] [int] NOT NULL,
	[customerUsername] [varchar](20) NOT NULL,
 CONSTRAINT [PK_subscriptionCustomer] PRIMARY KEY CLUSTERED 
(
	[subscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_subscriptionCustomer] FOREIGN KEY([subscriptionId])
REFERENCES [dbo].[subscriptionCustomer] ([subscriptionId])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_subscriptionCustomer]
GO
ALTER TABLE [dbo].[customerCompany]  WITH CHECK ADD  CONSTRAINT [FK_customerCompany_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[customerCompany] CHECK CONSTRAINT [FK_customerCompany_customer]
GO
ALTER TABLE [dbo].[developer]  WITH CHECK ADD  CONSTRAINT [FK_Developer_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[developer] CHECK CONSTRAINT [FK_Developer_Company]
GO
ALTER TABLE [dbo].[developer]  WITH CHECK ADD  CONSTRAINT [FK_Developer_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[developer] CHECK CONSTRAINT [FK_Developer_Product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Developer] FOREIGN KEY([developerId])
REFERENCES [dbo].[developer] ([developerId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_Product_Developer]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Platform] FOREIGN KEY([platformId])
REFERENCES [dbo].[platform] ([platformId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_Product_Platform]
GO
ALTER TABLE [dbo].[subscriptionCustomer]  WITH CHECK ADD  CONSTRAINT [FK_subscriptionCustomer_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[subscriptionCustomer] CHECK CONSTRAINT [FK_subscriptionCustomer_Company]
GO
