--Base de datos funcionando al 100
CREATE DATABASE abarrotes; 
USE abarrotes; 

CREATE TABLE Personal (
  NumSS INT NOT NULL, 
  Nombre VARCHAR(45) NULL,
  ApePaterno VARCHAR(45) NULL,
  ApeMaterno VARCHAR(45) NULL,
  TelPersonal VARCHAR (10) NULL,
  TelCasa VARCHAR (10) NULL,
  FechaContrato VARCHAR(10) NULL,
  FecuenciaPago VARCHAR(15) NULL,
  SueldoBase DECIMAL(7,2) NULL,
  PRIMARY KEY (NumSS)
);


CREATE TABLE Clientes (
  RFC VARCHAR(13) NOT NULL,
  Nombre VARCHAR(45) NULL,
  ApePaterno VARCHAR(45) NULL,
  ApeMaterno VARCHAR(45) NULL,
  Calle VARCHAR(20) NULL,
  Num INT NULL,
  Colonia VARCHAR(45) NULL,
  CP INT NULL,
  Alcaldia VARCHAR(45) NULL,
  PRIMARY KEY (RFC)
);

CREATE TABLE Proveedores (
  RFC VARCHAR(13) NOT NULL,
  NomEmpresa VARCHAR(45) NULL,
  NombreRepresentante VARCHAR(45) NULL,
  ApeP_Representante VARCHAR(45) NULL,
  TelContacto VARCHAR (10)NULL,
  DiaPedido VARCHAR(15) NULL,
  DiaEntrega VARCHAR(15) NULL,
  TipoPago VARCHAR(45) NULL,
  PRIMARY KEY (RFC)
);

CREATE TABLE Ventas (
  NumV INT NOT NULL,
  Fecha VARCHAR(10) NULL,
  Subtotal DECIMAL(7,2) NULL,
  IVA DECIMAL(7,2) NULL,
  Total DECIMAL(7,2) NULL,
  Clientes_RFC VARCHAR(13) NULL,
  Personal_NumSS INT NOT NULL,
  PRIMARY KEY (NumV),
  FOREIGN KEY (Clientes_RFC) REFERENCES Clientes(RFC),
  FOREIGN KEY (Personal_NumSS) REFERENCES Personal(NumSS)
);

CREATE TABLE Productos (
  CodProd INT NOT NULL,
  Descrip VARCHAR(45) NULL,
  PrecioV DECIMAL(7,2) NULL,
  Existencias INT NULL,
  StockMin INT NULL,
  StockMax INT NULL,
  Oferta VARCHAR (1) NULL,
  PRIMARY KEY (CodProd)
);

CREATE TABLE productosv (
  Cantidad INT NULL,
  PrecioV DECIMAL(7,2) NULL,
  Subtotal_Prod DECIMAL(7,2) NULL,
  Ventas_NumV INT NOT NULL,
  Productos_CodProd INT NOT NULL,
  PRIMARY KEY (Ventas_NumV, Productos_CodProd),
  FOREIGN KEY (Ventas_NumV) REFERENCES Ventas(NumV),
  FOREIGN KEY (Productos_CodProd) REFERENCES Productos(CodProd)
);

CREATE TABLE Compras (
  NumC INT NOT NULL,
  TipoPago VARCHAR(15) NULL,
  Subtotal DECIMAL(7,2) NULL,
  IVA DECIMAL(7,2) NULL,
  Total DECIMAL(7,2) NULL,
  Proveedores_RFC VARCHAR(13) NULL,
  PRIMARY KEY (NumC),
  FOREIGN KEY (Proveedores_RFC) REFERENCES Proveedores(RFC)
);

CREATE TABLE inventario (
  IdInventario int NOT NULL,
  CodProdInvent int NOT NULL,
  Empaque varchar(10) NOT NULL,
  Caducidad varchar(10) NOT NULL,
  Observaciones varchar(100) NOT NULL,
  PRIMARY KEY (IdInventario),
  FOREIGN KEY (CodProdInvent) REFERENCES Productos (CodProd)
);

--Registros
-- Insertar registros en la tabla Personal
INSERT INTO Personal (NumSS, Nombre, ApePaterno, ApeMaterno, TelPersonal, TelCasa, FechaContrato, FecuenciaPago, SueldoBase)
VALUES
(123, 'Juan', 'Pérez', 'González', '5551234567', '5559876543', '2022-01-01', 'Quincenal', 5000.00),
(234, 'María', 'López', 'García', '5552345678', '5558765432', '2022-02-01', 'Mensual', 6000.00),
(345, 'Pedro', 'Rodríguez', 'Martínez', '5553456789', '5557654321', '2022-03-01', 'Quincenal', 4500.00),
(456, 'Ana', 'Hernández', 'Sánchez', '5554567890', '5556543210', '2022-04-01', 'Mensual', 5500.00),
(567, 'Luis', 'González', 'Gómez', '5555678901', '5555432109', '2022-05-01', 'Quincenal', 4800.00),
(678, 'Laura', 'Pérez', 'Gutiérrez', '5556789012', '5554321098', '2022-06-01', 'Mensual', 6500.00),
(789, 'Carlos', 'López', 'Martínez', '5557890123', '5553210987', '2022-07-01', 'Quincenal', 5200.00),
(890, 'Mónica', 'Rodríguez', 'Hernández', '5558901234', '5552109876', '2022-08-01', 'Mensual', 5800.00),
(912, 'Jorge', 'García', 'Sánchez', '5559012345', '5551098765', '2022-09-01', 'Quincenal', 4700.00);

-- Insertar registros en la tabla Clientes
INSERT INTO Clientes (RFC, Nombre, ApePaterno, ApeMaterno, Calle, Num, Colonia, CP, Alcaldia)
VALUES
('ABCD12345678', 'Juan', 'López', 'Pérez', 'Calle Reforma', 123, 'Centro', 06000, 'Cuauhtémoc'),
('EFGH87654321', 'María', 'González', 'Hernández', 'Av. Juárez', 456, 'Polanco', 11550, 'Miguel Hidalgo'),
('IJKL34567890', 'Carlos', 'Rodríguez', 'Sánchez', 'Av. Insurgentes', 789, 'Del Valle', 03100, 'Benito Juárez'),
('MNOP54321098', 'Laura', 'Ramírez', 'Torres', 'Av. Revolución', 1011, 'San Ángel', 01000, 'Álvaro Obregón'),
('QRST09876543', 'Ana', 'Hernández', 'López', 'Calle 5 de Mayo', 121, 'Centro', 06000, 'Cuauhtémoc'),
('UVWX23456789', 'Pedro', 'García', 'Mendoza', 'Av. Reforma', 345, 'Juárez', 11570, 'Miguel Hidalgo'),
('YZAB98765432', 'Luis', 'Torres', 'Gómez', 'Av. Chapultepec', 567, 'Roma Norte', 06700, 'Cuauhtémoc'),
('CDEF32109876', 'Laura', 'González', 'Ramírez', 'Calle Durango', 789, 'Condesa', 06140, 'Cuauhtémoc'),
('GHIJ67890543', 'Carlos', 'Gómez', 'Hernández', 'Av. Universidad', 912, 'Copilco', 04360, 'Coyoacán');

-- Insertar registros en la tabla Proveedores
INSERT INTO Proveedores (RFC, NomEmpresa, NombreRepresentante, ApeP_Representante, TelContacto, DiaPedido, DiaEntrega, TipoPago)
VALUES
('ABCD12345678', 'Empresa 1', 'Juan', 'Pérez', '5551234567', 'Lunes', 'Miércoles', 'Contado'),
('EFGH87654321', 'Empresa 2', 'María', 'López', '5552345678', 'Martes', 'Jueves', 'Crédito'),
('IJKL34567890', 'Empresa 3', 'Pedro', 'Rodríguez', '5553456789', 'Miércoles', 'Viernes', 'Contado'),
('MNOP54321098', 'Empresa 4', 'Ana', 'Hernández', '5554567890', 'Jueves', 'Sábado', 'Crédito'),
('QRST09876543', 'Empresa 5', 'Luis', 'González', '5555678901', 'Viernes', 'Domingo', 'Contado'),
('UVWX23456789', 'Empresa 6', 'Laura', 'Pérez', '5556789012', 'Sábado', 'Lunes', 'Crédito'),
('YZAB98765432', 'Empresa 7', 'Carlos', 'López', '5557890123', 'Domingo', 'Martes', 'Contado'),
('CDEF32109876', 'Empresa 8', 'Mónica', 'Rodríguez', '5558901234', 'Lunes', 'Miércoles', 'Crédito'),
('GHIJ67890543', 'Empresa 9', 'Jorge', 'García', '5559012345', 'Martes', 'Jueves', 'Contado');

-- Insertar registros en la tabla Ventas
INSERT INTO Ventas (NumV, Fecha, Subtotal, IVA, Total, Clientes_RFC, Personal_NumSS)
VALUES
(1, '2023-06-01', 250.00, 40.00, 290.00, 'ABCD12345678', 123),
(2, '2023-06-02', 550.00, 88.00, 638.00, 'EFGH87654321', 234),
(3, '2023-06-03', 350.00, 56.00, 406.00, 'IJKL34567890', 345),
(4, '2023-06-04', 700.00, 112.00, 812.00, 'MNOP54321098', 456),
(5, '2023-06-05', 900.00, 144.00, 1044.00, 'QRST09876543', 567),
(6, '2023-06-06', 450.00, 72.00, 522.00, 'UVWX23456789', 678),
(7, '2023-06-07', 600.00, 96.00, 696.00, 'YZAB98765432', 789),
(8, '2023-06-08', 750.00, 120.00, 870.00, 'CDEF32109876', 890),
(9, '2023-06-09', 400.00, 64.00, 464.00, 'GHIJ67890543', 912);


-- Insertar registros en la tabla Productos
INSERT INTO Productos (CodProd, Descrip, PrecioV, Existencias, StockMin, StockMax, Oferta)
VALUES
(1, 'Producto 1', 20.00, 100, 10, 200, 'N'),
(2, 'Producto 2', 15.00, 50, 5, 100, 'N'),
(3, 'Producto 3', 30.00, 200, 20, 300, 'N'),
(4, 'Producto 4', 10.00, 80, 8, 150, 'N'),
(5, 'Producto 5', 25.00, 120, 15, 250, 'N'),
(6, 'Producto 6', 10.00, 60, 6, 100, 'N'),
(7, 'Producto 7', 30.00, 150, 12, 250, 'N'),
(8, 'Producto 8', 12.00, 90, 10, 200, 'N'),
(9, 'Producto 9', 8.00, 100, 10, 150, 'N');

-- Insertar registros en la tabla productosv
INSERT INTO productosv (Cantidad, PrecioV, Subtotal_Prod, Ventas_NumV, Productos_CodProd)
VALUES
(4, 20.00, 80.00, 1, 1),
(2, 15.00, 30.00, 1, 2),
(5, 30.00, 150.00, 2, 3),
(3, 10.00, 30.00, 2, 4),
(6, 25.00, 150.00, 3, 5),
(2, 10.00, 20.00, 3, 6),
(4, 30.00, 120.00, 4, 7),
(3, 12.00, 36.00, 4, 8),
(5, 8.00, 40.00, 5, 9);

-- Insertar registros en la tabla Compras
INSERT INTO Compras (NumC, TipoPago, Subtotal, IVA, Total, Proveedores_RFC)
VALUES
(1, 'Crédito', 500.00, 80.00, 580.00, 'ABCD12345678'),
(2, 'Contado', 800.00, 128.00, 928.00, 'EFGH87654321'),
(3, 'Crédito', 350.00, 56.00, 406.00, 'IJKL34567890'),
(4, 'Contado', 700.00, 112.00, 812.00, 'MNOP54321098'),
(5, 'Crédito', 900.00, 144.00, 1044.00, 'QRST09876543'),
(6, 'Contado', 450.00, 72.00, 522.00, 'UVWX23456789'),
(7, 'Crédito', 600.00, 96.00, 696.00, 'YZAB98765432'),
(8, 'Contado', 750.00, 120.00, 870.00, 'CDEF32109876'),
(9, 'Crédito', 400.00, 64.00, 464.00, 'GHIJ67890543');

-- Insertar registros en la tabla inventario
INSERT INTO inventario (IdInventario, CodProdInvent, Empaque, Caducidad, Observaciones)
VALUES
(10, 1, 'Caja', '2023-08-01', 'Lote A'),
(11, 2, 'Bolsa', '2023-07-15', 'Lote B'),
(12, 3, 'Caja', '2023-09-30', 'Lote C'),
(13, 4, 'Bolsa', '2023-07-31', 'Lote D'),
(14, 5, 'Caja', '2023-10-15', 'Lote E'),
(15, 6, 'Bolsa', '2023-07-30', 'Lote F'),
(16, 7, 'Caja', '2023-08-31', 'Lote G'),
(17, 8, 'Bolsa', '2023-09-15', 'Lote H'),
(18, 9, 'Caja', '2023-07-31', 'Lote I');


--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--PROCEDIMIENTO ALMACENADO PARA USO GENERAL
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
USE [abarrotes]
GO

-- Crear o reemplazar el procedimiento almacenado
CREATE OR ALTER PROCEDURE [dbo].[BuscarDatos]
    @tabla VARCHAR(50),
    @columnaBusqueda VARCHAR(70),
    @valorBusqueda VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql NVARCHAR(MAX);

    -- Construir la consulta dinámica
    SET @sql = N'SELECT * FROM ' + QUOTENAME(@tabla) + ' WHERE ' + QUOTENAME(@columnaBusqueda) + ' = @valorBusqueda;';

    -- Ejecutar la consulta dinámica
    EXEC sp_executesql @sql, N'@valorBusqueda VARCHAR(100)', @valorBusqueda = @valorBusqueda;
END;


------------------------------------
-----------------------------------
------------------------------------
--cadena de conexion propia
--Data Source=HPBCV;Initial Catalog=abarrotes;Integrated Security=True
------------------------------------
-----------------------------------
------------------------------------
