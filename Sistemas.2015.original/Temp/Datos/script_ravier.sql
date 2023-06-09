CREATE DATABASE [Ravier]  ON (NAME = N'Ravier_Data', FILENAME = N'D:\Sistemas\Ravier\Datos\Ravier_Data.MDF' , SIZE = 3, FILEGROWTH = 10%) LOG ON (NAME = N'Ravier_Log', FILENAME = N'D:\Sistemas\Ravier\Datos\Ravier_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE Modern_Spanish_CI_AS
GO

exec sp_dboption N'Ravier', N'autoclose', N'false'
GO

exec sp_dboption N'Ravier', N'bulkcopy', N'false'
GO

exec sp_dboption N'Ravier', N'trunc. log', N'true'
GO

exec sp_dboption N'Ravier', N'torn page detection', N'true'
GO

exec sp_dboption N'Ravier', N'read only', N'false'
GO

exec sp_dboption N'Ravier', N'dbo use', N'false'
GO

exec sp_dboption N'Ravier', N'single', N'false'
GO

exec sp_dboption N'Ravier', N'autoshrink', N'true'
GO

exec sp_dboption N'Ravier', N'ANSI null default', N'false'
GO

exec sp_dboption N'Ravier', N'recursive triggers', N'false'
GO

exec sp_dboption N'Ravier', N'ANSI nulls', N'false'
GO

exec sp_dboption N'Ravier', N'concat null yields null', N'false'
GO

exec sp_dboption N'Ravier', N'cursor close on commit', N'false'
GO

exec sp_dboption N'Ravier', N'default to local cursor', N'false'
GO

exec sp_dboption N'Ravier', N'quoted identifier', N'false'
GO

exec sp_dboption N'Ravier', N'ANSI warnings', N'false'
GO

exec sp_dboption N'Ravier', N'auto create statistics', N'true'
GO

exec sp_dboption N'Ravier', N'auto update statistics', N'true'
GO

use [Ravier]
GO

exec sp_addsrvrolemember N'BUILTIN\Administradores', sysadmin
GO

if not exists (select * from dbo.sysusers where name = N'magnus' and uid < 16382)
	EXEC sp_grantdbaccess N'magnus'
GO

exec sp_addrolemember N'db_owner', N'magnus'
GO

create rule [MayorCero] as @Valor > 0
GO
create rule [MayorIgualCero] as @Valor >= 0
GO
create rule [Moneda] as @Valor in ('PESOS', 'DOLARES')
GO
setuser
GO

EXEC sp_addtype N'TBooleano', N'bit', N'not null'
GO

setuser
GO

setuser
GO

EXEC sp_addtype N'TMoneda', N'varchar (10)', N'not null'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[Moneda]', N'[TMoneda]'
GO

setuser
GO

CREATE TABLE [dbo].[Banco] (
	[IdBanco] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (60) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Rubro] (
	[IdRubro] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoObra] (
	[IdTipoObra] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CaminoCritico] (
	[IdObra] [smallint] NOT NULL ,
	[Orden] [tinyint] NOT NULL ,
	[IdTarea] [tinyint] NOT NULL ,
	[Duracion] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cliente] (
	[IdCliente] [smallint] IDENTITY (1, 1) NOT NULL ,
	[RazonSocial] [varchar] (60) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Domicilio] [varchar] (60) COLLATE Modern_Spanish_CI_AS NULL ,
	[Telefono] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Email] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Localidad] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[CodigoPostal] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaNacimiento] [smalldatetime] NULL ,
	[DNI] [varchar] (12) COLLATE Modern_Spanish_CI_AS NULL ,
	[CUIT] [varchar] (15) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Duracion] (
	[IdObra] [smallint] NOT NULL ,
	[IdTarea] [tinyint] NOT NULL ,
	[Duracion] [tinyint] NOT NULL ,
	[Varianza] [tinyint] NOT NULL ,
	[FI1] [tinyint] NULL ,
	[FF1] [tinyint] NULL ,
	[FI2] [tinyint] NULL ,
	[FF2] [tinyint] NULL ,
	[FIReal] [tinyint] NULL ,
	[FFReal] [tinyint] NULL ,
	[Cc] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Empleado] (
	[IdEmpleado] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Apellido] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nombres] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Domicilio] [varchar] (60) COLLATE Modern_Spanish_CI_AS NULL ,
	[Email] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Movimiento] (
	[IdMovimiento] [int] IDENTITY (1, 1) NOT NULL ,
	[FechaEfectuada] [smalldatetime] NULL ,
	[Monto] [smallmoney] NOT NULL ,
	[Moneda] [TMoneda] NOT NULL ,
	[FormaPago] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Tipo] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Proveedor] (
	[IdProveedor] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Codigo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[RazonSocial] [varchar] (60) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Domicilio] [varchar] (60) COLLATE Modern_Spanish_CI_AS NULL ,
	[Localidad] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[CodigoPostal] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Telefono] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fax] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Email] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[PaginaWeb] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cuit] [varchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[Contacto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TelefonoContacto] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[MovilContacto] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[EmailContacto] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Resultados] (
	[IdProveedor] [tinyint] NOT NULL ,
	[RazonSocial] [varchar] (60) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Domicilio] [varchar] (60) COLLATE Modern_Spanish_CI_AS NULL ,
	[Telefono] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Email] [varchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cuit] [varchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdTipoObra] [tinyint] NOT NULL ,
	[Descrip] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Tarea] (
	[IdTarea] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Trabajo] (
	[IdTrabajo] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (255) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cheque] (
	[IdCheque] [smallint] IDENTITY (1, 1) NOT NULL ,
	[NumeroCheque] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdBanco] [tinyint] NULL ,
	[Monto] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Material] (
	[IdMaterial] [smallint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdRubro] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MovimientoAjuste] (
	[IdMovimiento] [int] NOT NULL ,
	[Tipo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdResponsable] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Obra] (
	[IdObra] [smallint] IDENTITY (1, 1) NOT NULL ,
	[IdTipoObra] [tinyint] NOT NULL ,
	[IdCliente] [smallint] NOT NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Descripcion] [varchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Presupuesto] [smallmoney] NOT NULL ,
	[Honorarios] [smallmoney] NOT NULL ,
	[Moneda] [TMoneda] NOT NULL ,
	[Superficie] [real] NULL ,
	[CantidadAmbientes] [tinyint] NULL ,
	[CantidadBanos] [tinyint] NULL ,
	[FechaInicio] [smalldatetime] NOT NULL ,
	[FechaFin] [smalldatetime] NULL ,
	[Estado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[TiempoEstimado] [smallint] NULL ,
	[Porcentaje] [int] NOT NULL ,
	[Fraccion] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Parcela] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[UnidadFuncional] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[NroCuentaMuni] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NroPartidaMuni] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NroObra] [varchar] (6) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RubroProveedor] (
	[IdProveedor] [tinyint] NOT NULL ,
	[IdRubro] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Servicio] (
	[IdServicio] [tinyint] IDENTITY (1, 1) NOT NULL ,
	[Descrip] [varchar] (255) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdRubro] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TelefonoCliente] (
	[IdCliente] [smallint] NOT NULL ,
	[Telefono] [varchar] (30) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Factura] (
	[IdFactura] [smallint] IDENTITY (1, 1) NOT NULL ,
	[NumeroFactura] [varchar] (15) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Fecha] [smalldatetime] NOT NULL ,
	[IdProveedor] [tinyint] NOT NULL ,
	[Pagado] [TBooleano] NOT NULL ,
	[Observaciones] [varchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[FechaPrevista] [smalldatetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DependenciaTarea] (
	[IdObra] [smallint] NOT NULL ,
	[IdTareaA] [tinyint] NOT NULL ,
	[IdTareaB] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialPrevisto] (
	[IdObra] [smallint] NOT NULL ,
	[IdMaterial] [smallint] NOT NULL ,
	[Cantidad] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MovimientoCheque] (
	[IdMovimiento] [int] NOT NULL ,
	[IdCheque] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MovimientoCobro] (
	[IdMovimiento] [int] NOT NULL ,
	[IdCliente] [smallint] NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[Tipo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OrdenTrabajo] (
	[IdOrdenTrabajo] [smallint] IDENTITY (1, 1) NOT NULL ,
	[IdProveedor] [tinyint] NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[TiempoEstimado] [smallint] NOT NULL ,
	[FechaInicio] [smalldatetime] NOT NULL ,
	[FechaFin] [smalldatetime] NULL ,
	[Estado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Porcentaje] [real] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TrabajoObra] (
	[IdObra] [smallint] NOT NULL ,
	[IdTrabajo] [tinyint] NOT NULL ,
	[FechaInicio] [smalldatetime] NOT NULL ,
	[FechaFin] [smalldatetime] NULL ,
	[Tiempo] [smallint] NULL ,
	[Porcentaje] [real] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Adicional] (
	[IdAdicional] [smallint] IDENTITY (1, 1) NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[FechaSolicitado] [smalldatetime] NOT NULL ,
	[FechaEfectuado] [smalldatetime] NULL ,
	[Descrip] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[ConCargo] [TBooleano] NOT NULL ,
	[IdOrdenTrabajo] [smallint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemFactMat] (
	[IdItemFactura] [int] IDENTITY (1, 1) NOT NULL ,
	[IdFactura] [smallint] NOT NULL ,
	[IdMaterial] [smallint] NOT NULL ,
	[Cantidad] [smallint] NOT NULL ,
	[PrecioUnitario] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemFactServ] (
	[IdItemFactura] [int] IDENTITY (1, 1) NOT NULL ,
	[IdFactura] [smallint] NOT NULL ,
	[IdServicio] [tinyint] NOT NULL ,
	[Precio] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemFactura] (
	[IdItemFactura] [int] IDENTITY (1, 1) NOT NULL ,
	[IdFactura] [smallint] NOT NULL ,
	[Precio] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemOrdenTrabajo] (
	[IdOrdenTrabajo] [smallint] NOT NULL ,
	[IdTarea] [tinyint] NOT NULL ,
	[TiempoInsumido] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PagoFactura] (
	[IdPagoFactura] [int] IDENTITY (1, 1) NOT NULL ,
	[IdMovimiento] [int] NOT NULL ,
	[IdFactura] [smallint] NOT NULL ,
	[Monto] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Remito] (
	[IdRemito] [smallint] IDENTITY (1, 1) NOT NULL ,
	[Numero] [varchar] (15) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdRecibe] [tinyint] NOT NULL ,
	[IdFactura] [smallint] NULL ,
	[IdProveedor] [tinyint] NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[Fecha] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemAdicional] (
	[IdAdicional] [smallint] NOT NULL ,
	[IdTrabajo] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemRemito] (
	[IdRemito] [smallint] NOT NULL ,
	[IdMaterial] [smallint] NOT NULL ,
	[Cantidad] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Pedido] (
	[IdPedido] [smallint] IDENTITY (1, 1) NOT NULL ,
	[Numero] [varchar] (15) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdSolicitante] [tinyint] NOT NULL ,
	[IdProcesa] [tinyint] NOT NULL ,
	[IdAutoriza] [tinyint] NOT NULL ,
	[IdProveedor] [tinyint] NOT NULL ,
	[IdObra] [smallint] NOT NULL ,
	[IdRemito] [smallint] NULL ,
	[Fecha] [smalldatetime] NOT NULL ,
	[Medio] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemPedido] (
	[IdPedido] [smallint] NOT NULL ,
	[IdMaterial] [smallint] NOT NULL ,
	[Cantidad] [smallint] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Banco] WITH NOCHECK ADD 
	CONSTRAINT [PK_Banco] PRIMARY KEY  CLUSTERED 
	(
		[IdBanco]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Rubro] WITH NOCHECK ADD 
	CONSTRAINT [PK_Rubro] PRIMARY KEY  CLUSTERED 
	(
		[IdRubro]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipoObra] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipoObra] PRIMARY KEY  CLUSTERED 
	(
		[IdTipoObra]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CaminoCritico] WITH NOCHECK ADD 
	CONSTRAINT [PK_CaminoCritico] PRIMARY KEY  CLUSTERED 
	(
		[IdObra],
		[Orden],
		[IdTarea]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Cliente] WITH NOCHECK ADD 
	CONSTRAINT [PK_Cliente] PRIMARY KEY  CLUSTERED 
	(
		[IdCliente]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Duracion] WITH NOCHECK ADD 
	CONSTRAINT [PK_Duracion] PRIMARY KEY  CLUSTERED 
	(
		[IdObra],
		[IdTarea]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Empleado] WITH NOCHECK ADD 
	CONSTRAINT [PK_Empleado] PRIMARY KEY  CLUSTERED 
	(
		[IdEmpleado]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Movimiento] WITH NOCHECK ADD 
	CONSTRAINT [PK_Movimiento] PRIMARY KEY  CLUSTERED 
	(
		[IdMovimiento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Proveedor] WITH NOCHECK ADD 
	CONSTRAINT [PK_Proveedor] PRIMARY KEY  CLUSTERED 
	(
		[IdProveedor]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Tarea] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tarea] PRIMARY KEY  CLUSTERED 
	(
		[IdTarea]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Trabajo] WITH NOCHECK ADD 
	CONSTRAINT [PK_Trabajo] PRIMARY KEY  CLUSTERED 
	(
		[IdTrabajo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Cheque] WITH NOCHECK ADD 
	CONSTRAINT [PK_Cheque] PRIMARY KEY  CLUSTERED 
	(
		[IdCheque]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Material] WITH NOCHECK ADD 
	CONSTRAINT [PK_Material] PRIMARY KEY  CLUSTERED 
	(
		[IdMaterial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MovimientoAjuste] WITH NOCHECK ADD 
	CONSTRAINT [PK_MovimientoAjuste] PRIMARY KEY  CLUSTERED 
	(
		[IdMovimiento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Obra] WITH NOCHECK ADD 
	CONSTRAINT [PK_Obra] PRIMARY KEY  CLUSTERED 
	(
		[IdObra]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RubroProveedor] WITH NOCHECK ADD 
	CONSTRAINT [PK_RubroProveedor] PRIMARY KEY  CLUSTERED 
	(
		[IdProveedor],
		[IdRubro]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Servicio] WITH NOCHECK ADD 
	CONSTRAINT [PK_Servicio] PRIMARY KEY  CLUSTERED 
	(
		[IdServicio]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TelefonoCliente] WITH NOCHECK ADD 
	CONSTRAINT [PK_TelefonoCliente] PRIMARY KEY  CLUSTERED 
	(
		[IdCliente],
		[Telefono]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Factura] WITH NOCHECK ADD 
	CONSTRAINT [PK_Factura] PRIMARY KEY  CLUSTERED 
	(
		[IdFactura]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DependenciaTarea] WITH NOCHECK ADD 
	CONSTRAINT [PK_DependenciaTarea] PRIMARY KEY  CLUSTERED 
	(
		[IdObra],
		[IdTareaA],
		[IdTareaB]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MaterialPrevisto] WITH NOCHECK ADD 
	CONSTRAINT [PK_MaterialPrevisto] PRIMARY KEY  CLUSTERED 
	(
		[IdObra],
		[IdMaterial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MovimientoCheque] WITH NOCHECK ADD 
	CONSTRAINT [PK_MovimientoCheque] PRIMARY KEY  CLUSTERED 
	(
		[IdMovimiento],
		[IdCheque]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MovimientoCobro] WITH NOCHECK ADD 
	CONSTRAINT [PK_MovimientoCobro] PRIMARY KEY  CLUSTERED 
	(
		[IdMovimiento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[OrdenTrabajo] WITH NOCHECK ADD 
	CONSTRAINT [PK_OrdenTrabajo] PRIMARY KEY  CLUSTERED 
	(
		[IdOrdenTrabajo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TrabajoObra] WITH NOCHECK ADD 
	CONSTRAINT [PK_TrabajoObra] PRIMARY KEY  CLUSTERED 
	(
		[IdObra],
		[IdTrabajo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Adicional] WITH NOCHECK ADD 
	CONSTRAINT [PK_Adicional] PRIMARY KEY  CLUSTERED 
	(
		[IdAdicional]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemFactMat] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemFactMat] PRIMARY KEY  CLUSTERED 
	(
		[IdItemFactura]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemFactServ] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemFactServ] PRIMARY KEY  CLUSTERED 
	(
		[IdItemFactura]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemFactura] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemFactura] PRIMARY KEY  CLUSTERED 
	(
		[IdItemFactura],
		[IdFactura]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemOrdenTrabajo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemOrdenTrabajo] PRIMARY KEY  CLUSTERED 
	(
		[IdOrdenTrabajo],
		[IdTarea]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PagoFactura] WITH NOCHECK ADD 
	CONSTRAINT [PK_PagoFactura] PRIMARY KEY  CLUSTERED 
	(
		[IdPagoFactura]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Remito] WITH NOCHECK ADD 
	CONSTRAINT [PK_Remito] PRIMARY KEY  CLUSTERED 
	(
		[IdRemito]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemAdicional] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemAdicional] PRIMARY KEY  CLUSTERED 
	(
		[IdAdicional],
		[IdTrabajo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemRemito] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemRemito] PRIMARY KEY  CLUSTERED 
	(
		[IdRemito],
		[IdMaterial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Pedido] WITH NOCHECK ADD 
	CONSTRAINT [PK_Pedido] PRIMARY KEY  CLUSTERED 
	(
		[IdPedido]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ItemPedido] WITH NOCHECK ADD 
	CONSTRAINT [PK_ItemPedido] PRIMARY KEY  CLUSTERED 
	(
		[IdPedido],
		[IdMaterial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Banco] WITH NOCHECK ADD 
	CONSTRAINT [IX_Banco] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Rubro] WITH NOCHECK ADD 
	CONSTRAINT [IX_Rubro] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipoObra] WITH NOCHECK ADD 
	CONSTRAINT [IX_TipoObra] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Cliente] WITH NOCHECK ADD 
	CONSTRAINT [IX_Cliente] UNIQUE  NONCLUSTERED 
	(
		[RazonSocial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Duracion] WITH NOCHECK ADD 
	CONSTRAINT [DF_Duracion_Cc] DEFAULT (0) FOR [Cc]
GO

ALTER TABLE [dbo].[Movimiento] WITH NOCHECK ADD 
	CONSTRAINT [CK_Movimiento_FormaPago] CHECK ([FormaPago] = 'CHEQUE' or [FormaPago] = 'EFECTIVO'),
	CONSTRAINT [CK_Movimiento_Tipo] CHECK ([Tipo] = 'PAGO' or ([Tipo] = 'COBRO' or [Tipo] = 'AJUSTE'))
GO

ALTER TABLE [dbo].[Proveedor] WITH NOCHECK ADD 
	CONSTRAINT [IX_Proveedor] UNIQUE  NONCLUSTERED 
	(
		[RazonSocial]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Tarea] WITH NOCHECK ADD 
	CONSTRAINT [IX_Tarea] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Trabajo] WITH NOCHECK ADD 
	CONSTRAINT [IX_Trabajo] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Cheque] WITH NOCHECK ADD 
	CONSTRAINT [IX_Cheque] UNIQUE  NONCLUSTERED 
	(
		[NumeroCheque]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Material] WITH NOCHECK ADD 
	CONSTRAINT [IX_Material] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MovimientoAjuste] WITH NOCHECK ADD 
	CONSTRAINT [CK_MovimientoAjuste] CHECK ([Tipo] = 'INICIAL' or [Tipo] = 'EXTRACCION')
GO

ALTER TABLE [dbo].[Obra] WITH NOCHECK ADD 
	CONSTRAINT [IX_Obra] UNIQUE  NONCLUSTERED 
	(
		[Nombre]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_Obra_1] UNIQUE  NONCLUSTERED 
	(
		[IdObra],
		[Fraccion],
		[Parcela],
		[UnidadFuncional]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_Obra_NroObra] UNIQUE  NONCLUSTERED 
	(
		[NroObra]
	)  ON [PRIMARY] ,
	CONSTRAINT [CK_Obra_Estado] CHECK ([Estado] = 'TERMINADA' or ([Estado] = 'DETENIDA' or [Estado] = 'INICIADA')),
	CONSTRAINT [CK_Obra_Fechas] CHECK ([FechaFin] >= [FechaInicio])
GO

ALTER TABLE [dbo].[Servicio] WITH NOCHECK ADD 
	CONSTRAINT [IX_Servicio] UNIQUE  NONCLUSTERED 
	(
		[Descrip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Factura] WITH NOCHECK ADD 
	CONSTRAINT [IX_Factura] UNIQUE  NONCLUSTERED 
	(
		[NumeroFactura]
	)  ON [PRIMARY] ,
	CONSTRAINT [CK_Factura] CHECK ([Tipo] = 'SERVICIOS' or [Tipo] = 'MATERIALES')
GO

ALTER TABLE [dbo].[MovimientoCobro] WITH NOCHECK ADD 
	CONSTRAINT [CK_MovimientoCobro_Tipo] CHECK ([Tipo] = 'OBRA' or [Tipo] = 'HONORARIOS')
GO

ALTER TABLE [dbo].[OrdenTrabajo] WITH NOCHECK ADD 
	CONSTRAINT [CK_OrdenTrabajo] CHECK ([Estado] = 'FINALIZADA' or ([Estado] = 'CANCELADA' or ([Estado] = 'DETENIDA' or [Estado] = 'INICIADA'))),
	CONSTRAINT [CK_OrdenTrabajo_Fechas] CHECK ([FechaFin] >= [FechaInicio])
GO

ALTER TABLE [dbo].[TrabajoObra] WITH NOCHECK ADD 
	CONSTRAINT [DF_TrabajoObra_Porcentaje] DEFAULT (0) FOR [Porcentaje],
	CONSTRAINT [CK_TrabajoObra_Fechas] CHECK ([FechaFin] >= [FechaInicio])
GO

ALTER TABLE [dbo].[Adicional] WITH NOCHECK ADD 
	CONSTRAINT [CK_Tabla1_Fechas] CHECK ([FechaEfectuado] >= [FechaSolicitado])
GO

ALTER TABLE [dbo].[Pedido] WITH NOCHECK ADD 
	CONSTRAINT [CK_Pedido] CHECK ([Medio] = 'E-MAIL' or ([Medio] = 'FAX' or [Medio] = 'TELEFONO'))
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[Moneda]', N'[Movimiento].[Moneda]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Movimiento].[Monto]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Cheque].[Monto]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Obra].[CantidadAmbientes]'
GO

EXEC sp_bindrule N'[dbo].[MayorIgualCero]', N'[Obra].[CantidadBanos]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Obra].[Honorarios]'
GO

EXEC sp_bindrule N'[dbo].[Moneda]', N'[Obra].[Moneda]'
GO

EXEC sp_bindrule N'[dbo].[MayorIgualCero]', N'[Obra].[Porcentaje]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Obra].[Presupuesto]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Obra].[Superficie]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[Obra].[TiempoEstimado]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[MaterialPrevisto].[Cantidad]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorIgualCero]', N'[OrdenTrabajo].[Porcentaje]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[OrdenTrabajo].[TiempoEstimado]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorIgualCero]', N'[TrabajoObra].[Porcentaje]'
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[TrabajoObra].[Tiempo]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[ItemFactMat].[Cantidad]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[ItemFactura].[Precio]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorIgualCero]', N'[ItemOrdenTrabajo].[TiempoInsumido]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[PagoFactura].[Monto]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[ItemRemito].[Cantidad]'
GO

setuser
GO

setuser
GO

EXEC sp_bindrule N'[dbo].[MayorCero]', N'[ItemPedido].[Cantidad]'
GO

setuser
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[Duracion]  TO [magnus]
GO

ALTER TABLE [dbo].[Cheque] ADD 
	CONSTRAINT [FK_Cheque_Banco] FOREIGN KEY 
	(
		[IdBanco]
	) REFERENCES [dbo].[Banco] (
		[IdBanco]
	)
GO

ALTER TABLE [dbo].[Material] ADD 
	CONSTRAINT [FK_Material_Rubro] FOREIGN KEY 
	(
		[IdRubro]
	) REFERENCES [dbo].[Rubro] (
		[IdRubro]
	)
GO

ALTER TABLE [dbo].[MovimientoAjuste] ADD 
	CONSTRAINT [FK_MovimientoAjuste_Empleado] FOREIGN KEY 
	(
		[IdResponsable]
	) REFERENCES [dbo].[Empleado] (
		[IdEmpleado]
	),
	CONSTRAINT [FK_MovimientoAjuste_Movimiento] FOREIGN KEY 
	(
		[IdMovimiento]
	) REFERENCES [dbo].[Movimiento] (
		[IdMovimiento]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Obra] ADD 
	CONSTRAINT [FK_Obra_Cliente] FOREIGN KEY 
	(
		[IdCliente]
	) REFERENCES [dbo].[Cliente] (
		[IdCliente]
	),
	CONSTRAINT [FK_Obra_TipoObra] FOREIGN KEY 
	(
		[IdTipoObra]
	) REFERENCES [dbo].[TipoObra] (
		[IdTipoObra]
	)
GO

ALTER TABLE [dbo].[RubroProveedor] ADD 
	CONSTRAINT [FK_RubroProveedor_Proveedor] FOREIGN KEY 
	(
		[IdProveedor]
	) REFERENCES [dbo].[Proveedor] (
		[IdProveedor]
	),
	CONSTRAINT [FK_RubroProveedor_Rubro] FOREIGN KEY 
	(
		[IdRubro]
	) REFERENCES [dbo].[Rubro] (
		[IdRubro]
	)
GO

ALTER TABLE [dbo].[Servicio] ADD 
	CONSTRAINT [FK_Servicio_Rubro] FOREIGN KEY 
	(
		[IdRubro]
	) REFERENCES [dbo].[Rubro] (
		[IdRubro]
	)
GO

ALTER TABLE [dbo].[TelefonoCliente] ADD 
	CONSTRAINT [FK_TelefonoCliente_Cliente] FOREIGN KEY 
	(
		[IdCliente]
	) REFERENCES [dbo].[Cliente] (
		[IdCliente]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Factura] ADD 
	CONSTRAINT [FK_Factura_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_Factura_Proveedor] FOREIGN KEY 
	(
		[IdProveedor]
	) REFERENCES [dbo].[Proveedor] (
		[IdProveedor]
	)
GO

ALTER TABLE [dbo].[DependenciaTarea] ADD 
	CONSTRAINT [FK_DependenciaTarea_Tarea] FOREIGN KEY 
	(
		[IdTareaA]
	) REFERENCES [dbo].[Tarea] (
		[IdTarea]
	),
	CONSTRAINT [FK_DependenciaTarea_Tarea1] FOREIGN KEY 
	(
		[IdTareaB]
	) REFERENCES [dbo].[Tarea] (
		[IdTarea]
	),
	CONSTRAINT [FK_DependenciaTrabajo_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[MaterialPrevisto] ADD 
	CONSTRAINT [FK_MaterialPrevisto_Material] FOREIGN KEY 
	(
		[IdMaterial]
	) REFERENCES [dbo].[Material] (
		[IdMaterial]
	),
	CONSTRAINT [FK_MaterialPrevisto_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	)
GO

ALTER TABLE [dbo].[MovimientoCheque] ADD 
	CONSTRAINT [FK_MovimientoCheque_Cheque] FOREIGN KEY 
	(
		[IdCheque]
	) REFERENCES [dbo].[Cheque] (
		[IdCheque]
	),
	CONSTRAINT [FK_MovimientoCheque_Movimiento] FOREIGN KEY 
	(
		[IdMovimiento]
	) REFERENCES [dbo].[Movimiento] (
		[IdMovimiento]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[MovimientoCobro] ADD 
	CONSTRAINT [FK_MovimientoCobro_Cliente] FOREIGN KEY 
	(
		[IdCliente]
	) REFERENCES [dbo].[Cliente] (
		[IdCliente]
	),
	CONSTRAINT [FK_MovimientoCobro_Movimiento] FOREIGN KEY 
	(
		[IdMovimiento]
	) REFERENCES [dbo].[Movimiento] (
		[IdMovimiento]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_MovimientoCobro_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	)
GO

ALTER TABLE [dbo].[OrdenTrabajo] ADD 
	CONSTRAINT [FK_OrdenTrabajo_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_OrdenTrabajo_Proveedor] FOREIGN KEY 
	(
		[IdProveedor]
	) REFERENCES [dbo].[Proveedor] (
		[IdProveedor]
	)
GO

ALTER TABLE [dbo].[TrabajoObra] ADD 
	CONSTRAINT [FK_TrabajoObra_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_TrabajoObra_Trabajo] FOREIGN KEY 
	(
		[IdTrabajo]
	) REFERENCES [dbo].[Trabajo] (
		[IdTrabajo]
	)
GO

ALTER TABLE [dbo].[Adicional] ADD 
	CONSTRAINT [FK_Adicional_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_Adicional_OrdenTrabajo] FOREIGN KEY 
	(
		[IdOrdenTrabajo]
	) REFERENCES [dbo].[OrdenTrabajo] (
		[IdOrdenTrabajo]
	)
GO

ALTER TABLE [dbo].[ItemFactMat] ADD 
	CONSTRAINT [FK_ItemFactMat_Factura] FOREIGN KEY 
	(
		[IdFactura]
	) REFERENCES [dbo].[Factura] (
		[IdFactura]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ItemFactMat_Material] FOREIGN KEY 
	(
		[IdMaterial]
	) REFERENCES [dbo].[Material] (
		[IdMaterial]
	)
GO

ALTER TABLE [dbo].[ItemFactServ] ADD 
	CONSTRAINT [FK_ItemFactServ_Factura] FOREIGN KEY 
	(
		[IdFactura]
	) REFERENCES [dbo].[Factura] (
		[IdFactura]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ItemFactServ_Servicio] FOREIGN KEY 
	(
		[IdServicio]
	) REFERENCES [dbo].[Servicio] (
		[IdServicio]
	)
GO

ALTER TABLE [dbo].[ItemFactura] ADD 
	CONSTRAINT [FK_ItemFactura_Factura1] FOREIGN KEY 
	(
		[IdFactura]
	) REFERENCES [dbo].[Factura] (
		[IdFactura]
	)
GO

ALTER TABLE [dbo].[ItemOrdenTrabajo] ADD 
	CONSTRAINT [FK_ItemOrdenTrabajo_OrdenTrabajo] FOREIGN KEY 
	(
		[IdOrdenTrabajo]
	) REFERENCES [dbo].[OrdenTrabajo] (
		[IdOrdenTrabajo]
	),
	CONSTRAINT [FK_ItemOrdenTrabajo_Tarea] FOREIGN KEY 
	(
		[IdTarea]
	) REFERENCES [dbo].[Tarea] (
		[IdTarea]
	)
GO

ALTER TABLE [dbo].[PagoFactura] ADD 
	CONSTRAINT [FK_PagoFactura_Factura] FOREIGN KEY 
	(
		[IdFactura]
	) REFERENCES [dbo].[Factura] (
		[IdFactura]
	),
	CONSTRAINT [FK_PagoFactura_Movimiento] FOREIGN KEY 
	(
		[IdMovimiento]
	) REFERENCES [dbo].[Movimiento] (
		[IdMovimiento]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Remito] ADD 
	CONSTRAINT [FK_Remito_Empleado] FOREIGN KEY 
	(
		[IdRecibe]
	) REFERENCES [dbo].[Empleado] (
		[IdEmpleado]
	),
	CONSTRAINT [FK_Remito_Factura] FOREIGN KEY 
	(
		[IdFactura]
	) REFERENCES [dbo].[Factura] (
		[IdFactura]
	),
	CONSTRAINT [FK_Remito_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_Remito_Proveedor] FOREIGN KEY 
	(
		[IdProveedor]
	) REFERENCES [dbo].[Proveedor] (
		[IdProveedor]
	)
GO

ALTER TABLE [dbo].[ItemAdicional] ADD 
	CONSTRAINT [FK_ItemAdicional_Adicional] FOREIGN KEY 
	(
		[IdAdicional]
	) REFERENCES [dbo].[Adicional] (
		[IdAdicional]
	),
	CONSTRAINT [FK_ItemAdicional_Trabajo] FOREIGN KEY 
	(
		[IdTrabajo]
	) REFERENCES [dbo].[Trabajo] (
		[IdTrabajo]
	)
GO

ALTER TABLE [dbo].[ItemRemito] ADD 
	CONSTRAINT [FK_ItemRemito_Material] FOREIGN KEY 
	(
		[IdMaterial]
	) REFERENCES [dbo].[Material] (
		[IdMaterial]
	),
	CONSTRAINT [FK_ItemRemito_Remito] FOREIGN KEY 
	(
		[IdRemito]
	) REFERENCES [dbo].[Remito] (
		[IdRemito]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Pedido] ADD 
	CONSTRAINT [FK_Pedido_Empleado] FOREIGN KEY 
	(
		[IdSolicitante]
	) REFERENCES [dbo].[Empleado] (
		[IdEmpleado]
	),
	CONSTRAINT [FK_Pedido_Empleado1] FOREIGN KEY 
	(
		[IdProcesa]
	) REFERENCES [dbo].[Empleado] (
		[IdEmpleado]
	),
	CONSTRAINT [FK_Pedido_Empleado2] FOREIGN KEY 
	(
		[IdAutoriza]
	) REFERENCES [dbo].[Empleado] (
		[IdEmpleado]
	),
	CONSTRAINT [FK_Pedido_Obra] FOREIGN KEY 
	(
		[IdObra]
	) REFERENCES [dbo].[Obra] (
		[IdObra]
	),
	CONSTRAINT [FK_Pedido_Proveedor] FOREIGN KEY 
	(
		[IdProveedor]
	) REFERENCES [dbo].[Proveedor] (
		[IdProveedor]
	),
	CONSTRAINT [FK_Pedido_Remito] FOREIGN KEY 
	(
		[IdRemito]
	) REFERENCES [dbo].[Remito] (
		[IdRemito]
	)
GO

ALTER TABLE [dbo].[ItemPedido] ADD 
	CONSTRAINT [FK_ItemPedido_Material] FOREIGN KEY 
	(
		[IdMaterial]
	) REFERENCES [dbo].[Material] (
		[IdMaterial]
	),
	CONSTRAINT [FK_ItemPedido_Pedido] FOREIGN KEY 
	(
		[IdPedido]
	) REFERENCES [dbo].[Pedido] (
		[IdPedido]
	) ON DELETE CASCADE 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create view vwFacturas as
SELECT     *
FROM         vwfacturasmant
UNION
SELECT     *
FROM         vwfacturasserv

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwProveedores
AS
SELECT     IdProveedor, RazonSocial, NombreFantasia, Domicilio, Telefono, Email, Cuit, Codigo, Fax, Contacto, TelefonoContacto
FROM         dbo.Proveedor

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwCaminoCritico
AS
SELECT     dbo.CaminoCritico.IdObra, dbo.CaminoCritico.Orden, dbo.CaminoCritico.IdTarea, dbo.Tarea.Descrip, dbo.CaminoCritico.Duracion
FROM         dbo.CaminoCritico INNER JOIN
                      dbo.Tarea ON dbo.CaminoCritico.IdTarea = dbo.Tarea.IdTarea

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwClientes
AS
SELECT     IdCliente, RazonSocial, Domicilio, Telefono, Email, Localidad, CodigoPostal, FechaNacimiento, DNI, CUIT
FROM         dbo.Cliente

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwDuracion
AS
SELECT     dbo.Duracion.IdObra, dbo.Duracion.IdTarea, dbo.Tarea.Descrip, dbo.Duracion.Duracion, dbo.Duracion.Varianza, dbo.Duracion.FF1, dbo.Duracion.FI2, 
                      dbo.Duracion.FF2, dbo.Duracion.FIReal, dbo.Duracion.FFReal
FROM         dbo.Duracion INNER JOIN
                      dbo.Tarea ON dbo.Duracion.IdTarea = dbo.Tarea.IdTarea

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwEmpleados
AS
SELECT     IdEmpleado, Apellido, Nombres, Domicilio, Email
FROM         dbo.Empleado

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwMateriales
AS
SELECT     dbo.Material.IdMaterial, dbo.Rubro.Descrip AS Rubro, dbo.Material.Descrip
FROM         dbo.Material INNER JOIN
                      dbo.Rubro ON dbo.Material.IdRubro = dbo.Rubro.IdRubro

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwObras
AS
SELECT     dbo.Obra.IdObra, dbo.TipoObra.Descrip AS TipoObra, dbo.Cliente.RazonSocial AS Cliente, dbo.Obra.Nombre, dbo.Obra.Presupuesto, 
                      dbo.Obra.Honorarios, dbo.Obra.Moneda, dbo.Obra.Superficie, dbo.Obra.FechaInicio, dbo.Obra.FechaFin, dbo.Obra.Estado, dbo.Obra.Porcentaje, 
                      dbo.Obra.Descripcion, dbo.Obra.CantidadAmbientes, dbo.Obra.CantidadBanos, dbo.Obra.TiempoEstimado, dbo.Obra.Fraccion, dbo.Obra.Parcela, 
                      dbo.Obra.UnidadFuncional, dbo.Obra.NroCuentaMuni, dbo.Obra.NroPartidaMuni, dbo.Obra.NroObra, dbo.Obra.IdCliente
FROM         dbo.Obra INNER JOIN
                      dbo.Cliente ON dbo.Obra.IdCliente = dbo.Cliente.IdCliente INNER JOIN
                      dbo.TipoObra ON dbo.Obra.IdTipoObra = dbo.TipoObra.IdTipoObra

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwRubroProveedor
AS
SELECT     dbo.RubroProveedor.IdProveedor, dbo.Rubro.IdRubro, dbo.Rubro.Descrip AS Rubro
FROM         dbo.Rubro INNER JOIN
                      dbo.RubroProveedor ON dbo.Rubro.IdRubro = dbo.RubroProveedor.IdRubro

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwServicios
AS
SELECT     dbo.Servicio.IdServicio, dbo.Servicio.Descrip, dbo.Rubro.Descrip AS Rubro
FROM         dbo.Rubro INNER JOIN
                      dbo.Servicio ON dbo.Rubro.IdRubro = dbo.Servicio.IdRubro

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwDependenciasTareas
AS
SELECT     TOP 100 PERCENT dbo.DependenciaTarea.IdObra, dbo.DependenciaTarea.IdTareaA, dbo.DependenciaTarea.IdTareaB, 
                      dbo.Tarea.Descrip AS TareaB
FROM         dbo.DependenciaTarea INNER JOIN
                      dbo.Tarea ON dbo.DependenciaTarea.IdTareaB = dbo.Tarea.IdTarea

Order By TareaB




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwMovimientosCobro
AS
SELECT     dbo.Movimiento.IdMovimiento, dbo.Obra.Nombre AS Obra, dbo.Cliente.RazonSocial AS Propietario, dbo.Movimiento.FechaEfectuada AS Fecha, 
                      dbo.Movimiento.Monto, dbo.Movimiento.Moneda, dbo.Movimiento.FormaPago, dbo.Movimiento.Tipo AS TipoMov, 
                      dbo.MovimientoCobro.Tipo AS TipoCobro, dbo.MovimientoCobro.IdObra, dbo.Cheque.NumeroCheque AS Cheque
FROM         dbo.Cheque INNER JOIN
                      dbo.MovimientoCheque ON dbo.Cheque.IdCheque = dbo.MovimientoCheque.IdCheque RIGHT OUTER JOIN
                      dbo.Movimiento INNER JOIN
                      dbo.MovimientoCobro ON dbo.Movimiento.IdMovimiento = dbo.MovimientoCobro.IdMovimiento INNER JOIN
                      dbo.Obra ON dbo.MovimientoCobro.IdObra = dbo.Obra.IdObra INNER JOIN
                      dbo.Cliente ON dbo.MovimientoCobro.IdCliente = dbo.Cliente.IdCliente AND dbo.Obra.IdCliente = dbo.Cliente.IdCliente ON 
                      dbo.MovimientoCheque.IdMovimiento = dbo.Movimiento.IdMovimiento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwFacturasMant
AS
SELECT     dbo.Factura.IdFactura, dbo.Factura.NumeroFactura AS Numero, dbo.Factura.Fecha, dbo.Proveedor.RazonSocial AS Proveedor, 
                      dbo.Obra.Nombre AS Obra, dbo.Factura.Pagado, dbo.Factura.Tipo, SUM(dbo.ItemFactMat.PrecioUnitario * dbo.ItemFactMat.Cantidad) AS Monto
FROM         dbo.Proveedor INNER JOIN
                      dbo.Factura ON dbo.Proveedor.IdProveedor = dbo.Factura.IdProveedor INNER JOIN
                      dbo.Obra ON dbo.Factura.IdObra = dbo.Obra.IdObra LEFT OUTER JOIN
                      dbo.ItemFactMat ON dbo.Factura.IdFactura = dbo.ItemFactMat.IdFactura
GROUP BY dbo.Factura.IdFactura, dbo.Factura.NumeroFactura, dbo.Factura.Fecha, dbo.Proveedor.RazonSocial, dbo.Obra.Nombre, dbo.Factura.Pagado, 
                      dbo.Factura.Tipo
HAVING      (dbo.Factura.Tipo = 'MATERIALES')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwFacturasServ
AS
SELECT     dbo.Factura.IdFactura, dbo.Factura.NumeroFactura AS Numero, dbo.Factura.Fecha, dbo.Proveedor.RazonSocial AS Proveedor, 
                      dbo.Obra.Nombre AS Obra, dbo.Factura.Pagado, dbo.Factura.Tipo, SUM(dbo.ItemFactServ.Precio) AS Monto
FROM         dbo.Proveedor INNER JOIN
                      dbo.Factura ON dbo.Proveedor.IdProveedor = dbo.Factura.IdProveedor INNER JOIN
                      dbo.Obra ON dbo.Factura.IdObra = dbo.Obra.IdObra LEFT OUTER JOIN
                      dbo.ItemFactServ ON dbo.Factura.IdFactura = dbo.ItemFactServ.IdFactura
GROUP BY dbo.Factura.IdFactura, dbo.Factura.NumeroFactura, dbo.Factura.Fecha, dbo.Proveedor.RazonSocial, dbo.Obra.Nombre, dbo.Factura.Pagado, 
                      dbo.Factura.Tipo
HAVING      (dbo.Factura.Tipo = 'SERVICIOS')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwPagosFactura
AS
SELECT     dbo.Movimiento.IdMovimiento, dbo.Proveedor.RazonSocial AS Proveedor, dbo.Factura.NumeroFactura AS Factura, 
                      dbo.Movimiento.FechaEfectuada AS Fecha, dbo.Movimiento.Monto, dbo.Movimiento.Moneda, dbo.Movimiento.FormaPago, 
                      dbo.Cheque.NumeroCheque AS Cheque
FROM         dbo.Cheque INNER JOIN
                      dbo.MovimientoCheque ON dbo.Cheque.IdCheque = dbo.MovimientoCheque.IdCheque RIGHT OUTER JOIN
                      dbo.PagoFactura INNER JOIN
                      dbo.Movimiento ON dbo.PagoFactura.IdMovimiento = dbo.Movimiento.IdMovimiento INNER JOIN
                      dbo.Factura ON dbo.PagoFactura.IdFactura = dbo.Factura.IdFactura INNER JOIN
                      dbo.Proveedor ON dbo.Factura.IdProveedor = dbo.Proveedor.IdProveedor ON dbo.MovimientoCheque.IdMovimiento = dbo.Movimiento.IdMovimiento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwRemitos
AS
SELECT     dbo.Remito.IdRemito, dbo.Remito.Fecha, dbo.Proveedor.RazonSocial AS Proveedor, dbo.Obra.Nombre AS Obra, 
                      dbo.Empleado.Apellido + ', ' + dbo.Empleado.Nombres AS Recibe, dbo.Remito.Numero, dbo.Remito.IdObra, dbo.Remito.IdFactura, 
                      dbo.Remito.IdProveedor
FROM         dbo.Remito INNER JOIN
                      dbo.Proveedor ON dbo.Remito.IdProveedor = dbo.Proveedor.IdProveedor INNER JOIN
                      dbo.Obra ON dbo.Remito.IdObra = dbo.Obra.IdObra INNER JOIN
                      dbo.Empleado ON dbo.Remito.IdRecibe = dbo.Empleado.IdEmpleado

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwPedidos
AS
SELECT     dbo.Pedido.IdPedido, dbo.Pedido.Numero, dbo.Obra.Nombre AS Obra, dbo.Proveedor.RazonSocial AS Proveedor, dbo.Pedido.IdSolicitante, 
                      dbo.Pedido.IdProcesa, dbo.Pedido.IdAutoriza, dbo.Pedido.Fecha, dbo.Pedido.IdObra, dbo.Pedido.IdRemito, dbo.Pedido.IdProveedor
FROM         dbo.Pedido INNER JOIN
                      dbo.Obra ON dbo.Pedido.IdObra = dbo.Obra.IdObra INNER JOIN
                      dbo.Proveedor ON dbo.Pedido.IdProveedor = dbo.Proveedor.IdProveedor

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE spGetMessage
(@Error int,
 @Description varchar(255) output)
AS

SELECT @Description = Description FROM master.dbo.sysmessages
WHERE Error = @Error AND MsgLangId = 3082
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE spGetIdBanco
(@Descrip char (60),
 @Id int OUTPUT)

AS

SELECT @Id = (SELECT IdBanco FROM dbo.Banco WHERE Descrip = @Descrip)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE spGetIdRubro
(@Descrip char (60),
 @Id int OUTPUT)

AS

SELECT @Id = (SELECT IdRubro FROM dbo.Rubro WHERE Descrip = @Descrip)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE spGetIdTipoObra
(@Descrip char (60),
 @Id int OUTPUT)

AS

SELECT @Id = (SELECT IdTipoObra FROM dbo.TipoObra WHERE Descrip = @Descrip)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER trSumaMontoFactura ON [dbo].[PagoFactura] 
FOR INSERT, UPDATE 
AS

DECLARE @SumaMontoFactura smallmoney
DECLARE @SumaMontoPago smallmoney

SELECT @SumaMontoFactura = SUM(Precio) FROM ItemFactura, Inserted
WHERE ItemFactura.IdFactura = Inserted.IdFactura

SELECT @SumaMontoPago = SUM(PagoFactura.Monto) FROM PagoFactura, Inserted
WHERE PagoFactura.IdFactura = Inserted.IdFactura

IF @SumaMontoPago > @SumaMontoFactura
BEGIN
	RAISERROR(50002, 11, 1)
	ROLLBACK TRANSACTION
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER trChequearObraRemito ON dbo.Remito 
FOR INSERT, UPDATE
AS

DECLARE @Cantidad1 tinyint
DECLARE @Cantidad2 tinyint

SELECT @Cantidad1 = COUNT(*) FROM Remito, Inserted
WHERE (Remito.IdFactura = Inserted.IdFactura) AND (Remito.IdObra <> Inserted.IdObra)

SELECT @Cantidad2 = COUNT(*) FROM Factura, Inserted, Remito
WHERE (Remito.IdFactura = Inserted.IdFactura) AND (Remito.IdObra <> Factura.IdObra) AND
(Factura.IdFactura = Inserted.IdFactura)

IF @Cantidad1 + @Cantidad2 > 0
BEGIN
	RAISERROR(50004, 11, 1)
	ROLLBACK TRANSACTION
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER trChequearObraPedido ON dbo.Pedido 
FOR INSERT, UPDATE 
AS

DECLARE @Cantidad1 tinyint
DECLARE @Cantidad2 tinyint

SELECT @Cantidad1 = COUNT(*) FROM Pedido, Inserted
WHERE (Pedido.IdRemito = Inserted.IdRemito) AND (Pedido.IdObra <> Inserted.IdObra)

SELECT @Cantidad2 = COUNT(*) FROM Pedido, Inserted, Remito
WHERE (Pedido.IdRemito = Inserted.IdRemito) AND (Pedido.IdObra <> Remito.IdObra) AND
(Remito.IdRemito = Inserted.IdRemito)

IF @Cantidad1 + @Cantidad2 > 0
BEGIN
	RAISERROR(50003, 11, 1)
	ROLLBACK TRANSACTION
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

