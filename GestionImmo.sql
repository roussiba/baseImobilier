USE [GestionImmo]
GO
/****** Object:  Table [dbo].[client]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] NOT NULL,
	[prenom] [varchar](30) NOT NULL,
	[nom] [varchar](20) NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entretien]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entretien](
	[id] [int] NOT NULL,
	[libelle] [varchar](20) NOT NULL,
	[idImmobilisation] [int] NOT NULL,
 CONSTRAINT [PK_entretien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[immobilisation]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[immobilisation](
	[id] [int] NOT NULL,
	[codeImmo] [varchar](20) NOT NULL,
	[descriptionImmo] [varchar](50) NOT NULL,
	[idTypeImmo] [int] NOT NULL,
	[idProprietaire] [int] NOT NULL,
 CONSTRAINT [PK_immobilisation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[id] [int] NOT NULL,
	[montant] [int] NOT NULL,
	[idClient] [int] NOT NULL,
	[idImmobilisation] [int] NOT NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proprietaire]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proprietaire](
	[id] [int] NOT NULL,
	[prenom] [varchar](20) NOT NULL,
	[nom] [varchar](30) NOT NULL,
 CONSTRAINT [PK_proprietaire] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[typeImmobilisation]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[typeImmobilisation](
	[id] [int] NOT NULL,
	[libelle] [varchar](20) NOT NULL,
 CONSTRAINT [PK_type_immobilisation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vente]    Script Date: 15/01/2017 15:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vente](
	[id] [int] NOT NULL,
	[montant] [decimal](2, 0) NOT NULL,
	[idImmobilisation] [int] NOT NULL,
	[idClient] [int] NOT NULL,
 CONSTRAINT [PK_vente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[entretien]  WITH CHECK ADD  CONSTRAINT [FK_entretien_immobilisation] FOREIGN KEY([idImmobilisation])
REFERENCES [dbo].[immobilisation] ([id])
GO
ALTER TABLE [dbo].[entretien] CHECK CONSTRAINT [FK_entretien_immobilisation]
GO
ALTER TABLE [dbo].[immobilisation]  WITH CHECK ADD  CONSTRAINT [FK_immobilisation_proprietaire] FOREIGN KEY([idProprietaire])
REFERENCES [dbo].[proprietaire] ([id])
GO
ALTER TABLE [dbo].[immobilisation] CHECK CONSTRAINT [FK_immobilisation_proprietaire]
GO
ALTER TABLE [dbo].[immobilisation]  WITH CHECK ADD  CONSTRAINT [FK_immobilisation_typeImmobilisation] FOREIGN KEY([idTypeImmo])
REFERENCES [dbo].[typeImmobilisation] ([id])
GO
ALTER TABLE [dbo].[immobilisation] CHECK CONSTRAINT [FK_immobilisation_typeImmobilisation]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_location_client] FOREIGN KEY([idClient])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_location_client]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_location_immobilisation] FOREIGN KEY([idImmobilisation])
REFERENCES [dbo].[immobilisation] ([id])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_location_immobilisation]
GO
ALTER TABLE [dbo].[vente]  WITH CHECK ADD  CONSTRAINT [FK_vente_client] FOREIGN KEY([idClient])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[vente] CHECK CONSTRAINT [FK_vente_client]
GO
ALTER TABLE [dbo].[vente]  WITH CHECK ADD  CONSTRAINT [FK_vente_immobilisation] FOREIGN KEY([idImmobilisation])
REFERENCES [dbo].[immobilisation] ([id])
GO
ALTER TABLE [dbo].[vente] CHECK CONSTRAINT [FK_vente_immobilisation]
GO
