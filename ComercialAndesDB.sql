-- 1. Crear y seleccionar la base de datos
CREATE DATABASE ComercialAndesDB;
GO

USE ComercialAndesDB;
GO

-- 2. Crear tablas principales
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCompleto VARCHAR(120) NOT NULL,
    Correo VARCHAR(120) NOT NULL,
    EstadoActivo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto VARCHAR(120) NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL CHECK (PrecioUnitario >= 0),
    StockActual INT NOT NULL CHECK (StockActual >= 0)
);
GO

CREATE TABLE Operaciones (
    OperacionID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    TotalOperacion DECIMAL(10,2) NOT NULL CHECK (TotalOperacion >= 0),
    FechaOperacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Operaciones_Clientes FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    CONSTRAINT FK_Operaciones_Productos FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO

-- 3. Insertar datos iniciales
INSERT INTO Clientes (NombreCompleto, Correo, EstadoActivo)
VALUES 
    ('Valeria Quispe Mendoza', 'valeria.quispe@ejemplo.com', 1),
    ('Carlos Huamán Rojas', 'carlos.huaman@ejemplo.com', 1),
    ('Lucía Paredes Soto', 'lucia.paredes@ejemplo.com', 1);
GO

INSERT INTO Productos (NombreProducto, PrecioUnitario, StockActual)
VALUES 
    ('Teclado Mecánico', 180.00, 25),
    ('Mouse Inalámbrico', 75.00, 40),
    ('Monitor 24 Pulgadas', 650.00, 12);
GO

INSERT INTO Operaciones (ClienteID, ProductoID, Cantidad, TotalOperacion)
VALUES 
    (1, 1, 2, 360.00),
    (2, 2, 3, 225.00);
GO

-- Verificación rápida de datos cargados
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Operaciones;
GO



