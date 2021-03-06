USE [Registracia]
GO
/****** Object:  Table [dbo].[DolzhnostUser]    Script Date: 28.04.2021 14:33:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DolzhnostUser](
	[CodRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](80) NULL,
 CONSTRAINT [PK_Dolzhnost] PRIMARY KEY CLUSTERED 
(
	[CodRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 28.04.2021 14:33:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[CodPerson] [int] IDENTITY(1,1) NOT NULL,
	[LoginReg] [varchar](80) NULL,
	[ParolReg] [varchar](80) NULL,
	[Imia] [varchar](80) NULL,
	[Telefon] [varchar](80) NULL,
	[Pochta] [varchar](80) NULL,
	[Pol] [varchar](80) NULL,
	[Dolzhnost] [varchar](80) NULL,
	[CodRol] [int] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[CodPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polzovatel]    Script Date: 28.04.2021 14:33:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polzovatel](
	[CodPolzovatel] [int] IDENTITY(1,1) NOT NULL,
	[LoginVhod] [varchar](80) NULL,
	[ParolVhod] [varchar](80) NULL,
	[CodPerson] [int] NULL,
 CONSTRAINT [PK_Polzovatel] PRIMARY KEY CLUSTERED 
(
	[CodPolzovatel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DolzhnostUser] ON 

INSERT [dbo].[DolzhnostUser] ([CodRol], [Rol]) VALUES (1, N'Администратор')
INSERT [dbo].[DolzhnostUser] ([CodRol], [Rol]) VALUES (2, N'Пользователь')
INSERT [dbo].[DolzhnostUser] ([CodRol], [Rol]) VALUES (3, N'Разработчик')
SET IDENTITY_INSERT [dbo].[DolzhnostUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([CodPerson], [LoginReg], [ParolReg], [Imia], [Telefon], [Pochta], [Pol], [Dolzhnost], [CodRol]) VALUES (1, N'vika2001', N'2001vikiwall', N'Малышева Виктория Александровна', N'89026189044', N'vikamalish2001@gmail.com', N'женский', N'программист', 3)
INSERT [dbo].[Persona] ([CodPerson], [LoginReg], [ParolReg], [Imia], [Telefon], [Pochta], [Pol], [Dolzhnost], [CodRol]) VALUES (2, N'igor1999', N'1234567', N'Алабушкин Игорь Денисович', N'89511144972', N'igor1999@gmail.com', N'мужской', N'системный администратор', 1)
INSERT [dbo].[Persona] ([CodPerson], [LoginReg], [ParolReg], [Imia], [Telefon], [Pochta], [Pol], [Dolzhnost], [CodRol]) VALUES (3, N'zenia1999', N'7654321', N'Пушкарев Евгений Александрович', N'89444466532', N'zenia1999', N'мужской', N'программист', 2)
INSERT [dbo].[Persona] ([CodPerson], [LoginReg], [ParolReg], [Imia], [Telefon], [Pochta], [Pol], [Dolzhnost], [CodRol]) VALUES (4, N'DworfTheBest', N'Parol12345', N'Ульфар Раймнхейн', N'89123456234', N'never@mail.com', N'мужицкий', N'паладин', 2)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Polzovatel] ON 

INSERT [dbo].[Polzovatel] ([CodPolzovatel], [LoginVhod], [ParolVhod], [CodPerson]) VALUES (1, N'vika2001', N'2001vikiwall', NULL)
INSERT [dbo].[Polzovatel] ([CodPolzovatel], [LoginVhod], [ParolVhod], [CodPerson]) VALUES (2, N'igor1999', N'1234567', 2)
INSERT [dbo].[Polzovatel] ([CodPolzovatel], [LoginVhod], [ParolVhod], [CodPerson]) VALUES (3, N'zenia1999', N'7654321', 3)
INSERT [dbo].[Polzovatel] ([CodPolzovatel], [LoginVhod], [ParolVhod], [CodPerson]) VALUES (4, N'DworfTheBest', N'Parol12345', 4)
SET IDENTITY_INSERT [dbo].[Polzovatel] OFF
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Dolzhnost] FOREIGN KEY([CodRol])
REFERENCES [dbo].[DolzhnostUser] ([CodRol])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Dolzhnost]
GO
ALTER TABLE [dbo].[Polzovatel]  WITH CHECK ADD  CONSTRAINT [FK_Polzovatel_Persona] FOREIGN KEY([CodPerson])
REFERENCES [dbo].[Persona] ([CodPerson])
GO
ALTER TABLE [dbo].[Polzovatel] CHECK CONSTRAINT [FK_Polzovatel_Persona]
GO
