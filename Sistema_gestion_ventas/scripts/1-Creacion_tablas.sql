CREATE DATABASE SistemaVentas;
GO

USE SistemaVentas;
GO

-- Tabla: TipoDocumento
CREATE TABLE TipoDocumento (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL
);

-- Tabla: Rol
CREATE TABLE Rol (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL
);

-- Tabla: Usuario
CREATE TABLE Usuario (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    Usuario NVARCHAR(50) UNIQUE NOT NULL,
    TipoDocumentoId INT NOT NULL,
    NumeroDocumento NVARCHAR(20) UNIQUE NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    FechaRegistro DATETIME NOT NULL,
    FOREIGN KEY (TipoDocumentoId) REFERENCES TipoDocumento(Id)
);

-- Tabla: UsuarioCredencial
CREATE TABLE UsuarioCredencial (
    Id INT PRIMARY KEY IDENTITY,
    UsuarioId INT NOT NULL,
    ClaveHash NVARCHAR(MAX) NOT NULL,
    UltimoCambio DATETIME NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);

-- Tabla: UsuarioRol (múltiples roles por usuario)
CREATE TABLE UsuarioRol (
    Id INT PRIMARY KEY IDENTITY,
    UsuarioId INT NOT NULL,
    RolId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    FOREIGN KEY (RolId) REFERENCES Rol(Id)
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100),
    TipoDocumentoId INT NOT NULL,
    NumeroDocumento NVARCHAR(20) UNIQUE NOT NULL,
    Correo NVARCHAR(100),
    Telefono NVARCHAR(20),
    FOREIGN KEY (TipoDocumentoId) REFERENCES TipoDocumento(Id)
);

-- Tabla: Categoria
CREATE TABLE Categoria (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(50),
);

-- Tabla: Marca
CREATE TABLE Marca (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(50)
);

-- Tabla: Medida
CREATE TABLE Medida (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR (50),
    Abreviatura NVARCHAR(10) NOT NULL
);

-- Tabla: Producto
CREATE TABLE Producto (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    Descripcion NVARCHAR(50),
    PrecioCompra DECIMAL(10,2),
    PrecioVenta DECIMAL(10,2),
    CategoriaId INT NOT NULL,
    MarcaId INT,
    MedidaId INT,
    Estado BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id),
    FOREIGN KEY (MarcaId) REFERENCES Marca(Id),
    FOREIGN KEY (MedidaId) REFERENCES Medida(Id)
);

-- Tabla: Venta
CREATE TABLE Venta (
    Id INT PRIMARY KEY IDENTITY,
    ClienteId INT,
    UsuarioId INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);

-- Tabla: DetalleVenta
CREATE TABLE DetalleVenta (
    Id INT PRIMARY KEY IDENTITY,
    VentaId INT NOT NULL,
    ProductoId INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (VentaId) REFERENCES Venta(Id),
    FOREIGN KEY (ProductoId) REFERENCES Producto(Id)
);

-- Tabla: Inventario (Kardex)
CREATE TABLE Inventario (
    Id INT PRIMARY KEY IDENTITY,
    ProductoId INT NOT NULL,
    UsuarioId INT NOT NULL,
    Fecha DATETIME NOT NULL,
    TipoMovimiento NVARCHAR(20) NOT NULL,
    Cantidad INT NOT NULL,
    Observacion NVARCHAR(200),
    FOREIGN KEY (ProductoId) REFERENCES Producto(Id),
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);
