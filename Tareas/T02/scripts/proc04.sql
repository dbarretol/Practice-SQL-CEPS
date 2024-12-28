-- 4. Realizar una base de datos similar a Northwind, pero que los nombre de tablas, campos y registros estén en castellano.

-- 
CREATE PROCEDURE CrearBaseDeDatosNorthwindESP
AS
BEGIN

    -- Crear la base de datos NORTHWIND_ESP
    CREATE DATABASE NORTHWIND_ESP;
    GO

    -- Cambiar al contexto de la base de datos NORTHWIND_ESP
    USE NORTHWIND_ESP;
    GO
    /****** Objeto: Tabla [dbo].[Categorias]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Categorias](
        [IDCategoria] [int] IDENTITY(1,1) NOT NULL,
        [NombreCategoria] [nvarchar](15) NOT NULL,
        [Descripcion] [ntext] NULL,
        [Imagen] [image] NULL,
    CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
    (
        [IDCategoria] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[ClienteDemo]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[ClienteDemo](
        [IDCliente] [nchar](5) NOT NULL,
        [IDTipoCliente] [nchar](10) NOT NULL,
    CONSTRAINT [PK_ClienteDemo] PRIMARY KEY NONCLUSTERED 
    (
        [IDCliente] ASC,
        [IDTipoCliente] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[DemografiaClientes]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[DemografiaClientes](
        [IDTipoCliente] [nchar](10) NOT NULL,
        [DescripcionCliente] [ntext] NULL,
    CONSTRAINT [PK_DemografiaClientes] PRIMARY KEY NONCLUSTERED 
    (
        [IDTipoCliente] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Clientes]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Clientes](
        [IDCliente] [nchar](5) NOT NULL,
        [NombreEmpresa] [nvarchar](40) NOT NULL,
        [NombreContacto] [nvarchar](30) NULL,
        [TituloContacto] [nvarchar](30) NULL,
        [Direccion] [nvarchar](60) NULL,
        [Ciudad] [nvarchar](15) NULL,
        [Region] [nvarchar](15) NULL,
        [CodigoPostal] [nvarchar](10) NULL,
        [Pais] [nvarchar](15) NULL,
        [Telefono] [nvarchar](24) NULL,
        [Fax] [nvarchar](24) NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
    (
        [IDCliente] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Empleados]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Empleados](
        [IDEmpleado] [int] IDENTITY(1,1) NOT NULL,
        [Apellido] [nvarchar](20) NOT NULL,
        [Nombre] [nvarchar](10) NOT NULL,
        [Titulo] [nvarchar](30) NULL,
        [TituloCortesia] [nvarchar](25) NULL,
        [FechaNacimiento] [datetime] NULL,
        [FechaContratacion] [datetime] NULL,
        [Direccion] [nvarchar](60) NULL,
        [Ciudad] [nvarchar](15) NULL,
        [Region] [nvarchar](15) NULL,
        [CodigoPostal] [nvarchar](10) NULL,
        [Pais] [nvarchar](15) NULL,
        [TelefonoCasa] [nvarchar](24) NULL,
        [Extension] [nvarchar](4) NULL,
        [Foto] [image] NULL,
        [Notas] [ntext] NULL,
        [Jefe] [int] NULL,
        [RutaFoto] [nvarchar](255) NULL,
    CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
    (
        [IDEmpleado] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[TerritoriosEmpleados]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[TerritoriosEmpleados](
        [IDEmpleado] [int] NOT NULL,
        [IDTerritorio] [nvarchar](20) NOT NULL,
    CONSTRAINT [PK_TerritoriosEmpleados] PRIMARY KEY NONCLUSTERED 
    (
        [IDEmpleado] ASC,
        [IDTerritorio] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[DetallesPedidos]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[DetallesPedidos](
        [IDPedido] [int] NOT NULL,
        [IDProducto] [int] NOT NULL,
        [PrecioUnidad] [money] NOT NULL,
        [Cantidad] [smallint] NOT NULL,
        [Descuento] [real] NOT NULL,
    CONSTRAINT [PK_DetallesPedidos] PRIMARY KEY CLUSTERED 
    (
        [IDPedido] ASC,
        [IDProducto] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Pedidos]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Pedidos](
        [IDPedido] [int] IDENTITY(1,1) NOT NULL,
        [IDCliente] [nchar](5) NULL,
        [IDEmpleado] [int] NULL,
        [FechaPedido] [datetime] NULL,
        [FechaRequerida] [datetime] NULL,
        [FechaEnvio] [datetime] NULL,
        [EnvioPor] [int] NULL,
        [Flete] [money] NULL,
        [NombreEnvio] [nvarchar](40) NULL,
        [DireccionEnvio] [nvarchar](60) NULL,
        [CiudadEnvio] [nvarchar](15) NULL,
        [RegionEnvio] [nvarchar](15) NULL,
        [CodigoPostalEnvio] [nvarchar](10) NULL,
        [PaisEnvio] [nvarchar](15) NULL,
    CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
    (
        [IDPedido] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Productos]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Productos](
        [IDProducto] [int] IDENTITY(1,1) NOT NULL,
        [NombreProducto] [nvarchar](40) NOT NULL,
        [IDProveedor] [int] NULL,
        [IDCategoria] [int] NULL,
        [CantidadPorUnidad] [nvarchar](20) NULL,
        [PrecioUnidad] [money] NULL,
        [UnidadesEnStock] [smallint] NULL,
        [UnidadesEnPedido] [smallint] NULL,
        [NivelReorden] [smallint] NULL,
        [Descontinuado] [bit] NOT NULL,
    CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
    (
        [IDProducto] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Region]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Region](
        [IDRegion] [int] NOT NULL,
        [DescripcionRegion] [nchar](50) NOT NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
    (
        [IDRegion] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Transportistas]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Transportistas](
        [IDTransportista] [int] IDENTITY(1,1) NOT NULL,
        [NombreCompañia] [nvarchar](40) NOT NULL,
        [Telefono] [nvarchar](24) NULL,
    CONSTRAINT [PK_Transportistas] PRIMARY KEY CLUSTERED 
    (
        [IDTransportista] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Proveedores]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Proveedores](
        [IDProveedor] [int] IDENTITY(1,1) NOT NULL,
        [NombreCompañia] [nvarchar](40) NOT NULL,
        [NombreContacto] [nvarchar](30) NULL,
        [TituloContacto] [nvarchar](30) NULL,
        [Direccion] [nvarchar](60) NULL,
        [Ciudad] [nvarchar](15) NULL,
        [Region] [nvarchar](15) NULL,
        [CodigoPostal] [nvarchar](10) NULL,
        [Pais] [nvarchar](15) NULL,
        [Telefono] [nvarchar](24) NULL,
        [Fax] [nvarchar](24) NULL,
        [PaginaWeb] [ntext] NULL,
    CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
    (
        [IDProveedor] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
    /****** Objeto: Tabla [dbo].[Territorios]    Fecha de creación del script: 28/12/2024 17:13:01 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    CREATE TABLE [dbo].[Territorios](
        [IDTerritorio] [nvarchar](20) NOT NULL,
        [DescripcionTerritorio] [nchar](50) NOT NULL,
        [IDRegion] [int] NOT NULL,
    CONSTRAINT [PK_Territorios] PRIMARY KEY NONCLUSTERED 
    (
        [IDTerritorio] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    ALTER TABLE [dbo].[DetallesPedidos] ADD  CONSTRAINT [DF_DetallesPedidos_PrecioUnidad]  DEFAULT ((0)) FOR [PrecioUnidad]
    GO
    ALTER TABLE [dbo].[DetallesPedidos] ADD  CONSTRAINT [DF_DetallesPedidos_Cantidad]  DEFAULT ((1)) FOR [Cantidad]
    GO
    ALTER TABLE [dbo].[DetallesPedidos] ADD  CONSTRAINT [DF_DetallesPedidos_Descuento]  DEFAULT ((0)) FOR [Descuento]
    GO
    ALTER TABLE [dbo].[Pedidos] ADD  CONSTRAINT [DF_Pedidos_Flete]  DEFAULT ((0)) FOR [Flete]
    GO
    ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_PrecioUnidad]  DEFAULT ((0)) FOR [PrecioUnidad]
    GO
    ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_UnidadesEnStock]  DEFAULT ((0)) FOR [UnidadesEnStock]
    GO
    ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_UnidadesEnPedido]  DEFAULT ((0)) FOR [UnidadesEnPedido]
    GO
    ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_NivelReorden]  DEFAULT ((0)) FOR [NivelReorden]
    GO
    ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_Descontinuado]  DEFAULT ((0)) FOR [Descontinuado]
    GO
    ALTER TABLE [dbo].[ClienteDemo]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDemo] FOREIGN KEY([IDTipoCliente])
    REFERENCES [dbo].[DemografiaClientes] ([IDTipoCliente])
    GO
    ALTER TABLE [dbo].[ClienteDemo] CHECK CONSTRAINT [FK_ClienteDemo]
    GO
    ALTER TABLE [dbo].[ClienteDemo]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDemo_Clientes] FOREIGN KEY([IDCliente])
    REFERENCES [dbo].[Clientes] ([IDCliente])
    GO
    ALTER TABLE [dbo].[ClienteDemo] CHECK CONSTRAINT [FK_ClienteDemo_Clientes]
    GO
    ALTER TABLE [dbo].[Empleados]  WITH NOCHECK ADD  CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([Jefe])
    REFERENCES [dbo].[Empleados] ([IDEmpleado])
    GO
    ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Empleados]
    GO
    ALTER TABLE [dbo].[TerritoriosEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_TerritoriosEmpleados_Empleados] FOREIGN KEY([IDEmpleado])
    REFERENCES [dbo].[Empleados] ([IDEmpleado])
    GO
    ALTER TABLE [dbo].[TerritoriosEmpleados] CHECK CONSTRAINT [FK_TerritoriosEmpleados_Empleados]
    GO
    ALTER TABLE [dbo].[TerritoriosEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_TerritoriosEmpleados_Territorios] FOREIGN KEY([IDTerritorio])
    REFERENCES [dbo].[Territorios] ([IDTerritorio])
    GO
    ALTER TABLE [dbo].[TerritoriosEmpleados] CHECK CONSTRAINT [FK_TerritoriosEmpleados_Territorios]
    GO
    ALTER TABLE [dbo].[DetallesPedidos]  WITH NOCHECK ADD  CONSTRAINT [FK_DetallesPedidos_Pedidos] FOREIGN KEY([IDPedido])
    REFERENCES [dbo].[Pedidos] ([IDPedido])
    GO
    ALTER TABLE [dbo].[DetallesPedidos] CHECK CONSTRAINT [FK_DetallesPedidos_Pedidos]
    GO
    ALTER TABLE [dbo].[DetallesPedidos]  WITH NOCHECK ADD  CONSTRAINT [FK_DetallesPedidos_Productos] FOREIGN KEY([IDProducto])
    REFERENCES [dbo].[Productos] ([IDProducto])
    GO
    ALTER TABLE [dbo].[DetallesPedidos] CHECK CONSTRAINT [FK_DetallesPedidos_Productos]
    GO
    ALTER TABLE [dbo].[Pedidos]  WITH NOCHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([IDCliente])
    REFERENCES [dbo].[Clientes] ([IDCliente])
    GO
    ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
    GO
    ALTER TABLE [dbo].[Pedidos]  WITH NOCHECK ADD  CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY([IDEmpleado])
    REFERENCES [dbo].[Empleados] ([IDEmpleado])
    GO
    ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Empleados]
    GO
    ALTER TABLE [dbo].[Pedidos]  WITH NOCHECK ADD  CONSTRAINT [FK_Pedidos_Transportistas] FOREIGN KEY([EnvioPor])
    REFERENCES [dbo].[Transportistas] ([IDTransportista])
    GO
    ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Transportistas]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IDCategoria])
    REFERENCES [dbo].[Categorias] ([IDCategoria])
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([IDProveedor])
    REFERENCES [dbo].[Proveedores] ([IDProveedor])
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
    GO
    ALTER TABLE [dbo].[Territorios]  WITH CHECK ADD  CONSTRAINT [FK_Territorios_Region] FOREIGN KEY([IDRegion])
    REFERENCES [dbo].[Region] ([IDRegion])
    GO
    ALTER TABLE [dbo].[Territorios] CHECK CONSTRAINT [FK_Territorios_Region]
    GO
    ALTER TABLE [dbo].[Empleados]  WITH NOCHECK ADD  CONSTRAINT [CK_FechaNacimiento] CHECK  (([FechaNacimiento]<getdate()))
    GO
    ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [CK_FechaNacimiento]
    GO
    ALTER TABLE [dbo].[DetallesPedidos]  WITH NOCHECK ADD  CONSTRAINT [CK_Descuento] CHECK  (([Descuento]>=(0) AND [Descuento]<=(1)))
    GO
    ALTER TABLE [dbo].[DetallesPedidos] CHECK CONSTRAINT [CK_Descuento]
    GO
    ALTER TABLE [dbo].[DetallesPedidos]  WITH NOCHECK ADD  CONSTRAINT [CK_Cantidad] CHECK  (([Cantidad]>(0)))
    GO
    ALTER TABLE [dbo].[DetallesPedidos] CHECK CONSTRAINT [CK_Cantidad]
    GO
    ALTER TABLE [dbo].[DetallesPedidos]  WITH NOCHECK ADD  CONSTRAINT [CK_PrecioUnidad] CHECK  (([PrecioUnidad]>=(0)))
    GO
    ALTER TABLE [dbo].[DetallesPedidos] CHECK CONSTRAINT [CK_PrecioUnidad]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [CK_Productos_PrecioUnidad] CHECK  (([PrecioUnidad]>=(0)))
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK_Productos_PrecioUnidad]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [CK_NivelReorden] CHECK  (([NivelReorden]>=(0)))
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK_NivelReorden]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [CK_UnidadesEnStock] CHECK  (([UnidadesEnStock]>=(0)))
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK_UnidadesEnStock]
    GO
    ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [CK_UnidadesEnPedido] CHECK  (([UnidadesEnPedido]>=(0)))
    GO
    ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK_UnidadesEnPedido]
    GO

END
GO

-- Prueba
EXEC CrearBaseDeDatosNorthwindESP;
