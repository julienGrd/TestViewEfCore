Create database TestViewEFCoreDb
GO

use TestViewEFCoreDb;
go


/****** Object:  Table [dbo].[Enfants]    Script Date: 27/03/2023 16:24:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Enfants](
	[NumDos] [int] NOT NULL,
	[Nom] [nvarchar](100) NOT NULL,
	[Prenom] [nvarchar](100) NOT NULL,
	[DateNais] [date] NULL,
	[RangNais] [char](1) NULL,
	[Clo] [tinyint] NOT NULL,
	[CoordID] [smallint] NULL,
	[Sexe] [char](1) NULL,
	[Fratrie_Rang] [tinyint] NOT NULL,
	[Fratrie_Nb] [tinyint] NOT NULL,
	[AssureID] [int] NULL,
	[DateMaj] [datetime] NULL,
	[ReferentID] [smallint] NULL,
	[NumDosPap] [varchar](8) NULL,
	[FratrieId] [int] NULL,
	[MdphNum] [varchar](9) NULL,
	[DateNaisC] [date] NULL,
	[NirCertif] [varchar](13) NULL,
	[HasConsentMsc] [bit] NOT NULL,
	[HasConsentMss] [bit] NOT NULL,
	[HasConsentDmp] [bit] NOT NULL,
 CONSTRAINT [PK_Enfant] PRIMARY KEY CLUSTERED 
(
	[NumDos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Inss](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[Matricule] [varchar](15) NOT NULL,
	[OpDt] [smalldatetime] NOT NULL,
	[FinDate] [smalldatetime] NULL,
	[Oid] [varchar](20) NULL,
	[UsNom] [varchar](100) NULL,
	[UsPrenoms] [varchar](100) NULL,
	[TsNaisNom] [varchar](100) NULL,
	[TsNaisPrenoms] [varchar](100) NULL,
	[TsNaisDate] [varchar](10) NULL,
	[VilleID] [int] NULL,
	[TsSexe] [char](1) NULL,
	[WsRetour] [varchar](2) NULL,
	[ExceptionDetail] [varchar](1000) NULL,
	[TsNaisPremPrenom] [varchar](60) NULL,
	[OrigNum] [tinyint] NOT NULL,
	[WsOpNum] [tinyint] NOT NULL,
	[IdentJustifNum] [tinyint] NULL,
	[IdentIsValidated] [bit] NOT NULL,
	[IntervNum] [smallint] NULL,
 CONSTRAINT [PK_Ins] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Inss] ADD  DEFAULT ((0)) FOR [OrigNum]
GO

ALTER TABLE [dbo].[Inss] ADD  DEFAULT ((0)) FOR [WsOpNum]
GO

ALTER TABLE [dbo].[Inss] ADD  DEFAULT ((0)) FOR [IdentIsValidated]
GO


CREATE TABLE [dbo].[Enfs_Inss](
	[NumDos] [int] NOT NULL,
	[InsIndex] [int] NOT NULL,
 CONSTRAINT [PK_EnfIns] PRIMARY KEY CLUSTERED 
(
	[NumDos] ASC,
	[InsIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Enfs_Inss]  WITH CHECK ADD  CONSTRAINT [FK_EnfIns_Enfant] FOREIGN KEY([NumDos])
REFERENCES [dbo].[Enfants] ([NumDos])
GO

ALTER TABLE [dbo].[Enfs_Inss] CHECK CONSTRAINT [FK_EnfIns_Enfant]
GO

ALTER TABLE [dbo].[Enfs_Inss]  WITH CHECK ADD  CONSTRAINT [FK_EnfIns_Ins] FOREIGN KEY([InsIndex])
REFERENCES [dbo].[Inss] ([Index])
GO

ALTER TABLE [dbo].[Enfs_Inss] CHECK CONSTRAINT [FK_EnfIns_Ins]
GO


CREATE VIEW [dbo].[View_LastIns]
AS
SELECT     LastEnfIns.NumDos, dbo.Inss.[Index], dbo.Inss.Matricule, dbo.Inss.OpDt, dbo.Inss.OrigNum, dbo.Inss.WsOpNum, dbo.Inss.FinDate, dbo.Inss.Oid, dbo.Inss.UsNom, dbo.Inss.UsPrenoms, 
                      dbo.Inss.TsNaisNom, dbo.Inss.TsNaisPrenoms, dbo.Inss.TsNaisPremPrenom, dbo.Inss.TsNaisDate, dbo.Inss.VilleID, dbo.Inss.TsSexe, 
                      dbo.Inss.WsRetour, dbo.Inss.ExceptionDetail, dbo.Inss.IdentJustifNum, dbo.Inss.IntervNum, dbo.Inss.IdentIsValidated
FROM         dbo.Inss INNER JOIN
                          (SELECT     NumDos, MAX(InsIndex) AS InsIndex
                            FROM          dbo.Enfs_Inss
                            GROUP BY NumDos) AS LastEnfIns ON LastEnfIns.InsIndex = dbo.Inss.[Index]







GO
