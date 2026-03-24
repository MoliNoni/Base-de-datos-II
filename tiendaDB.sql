CREATE DATABASE TiendaDB;
GO

USE TiendaDB;
GO

CREATE TABLE Productos (
    IdProducto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0)
);
GO

INSERT INTO Productos (Nombre, Precio) VALUES
('Lapicero', 2.50),
('Cuaderno', 5.00),
('Resma de papel', 12.00),
('Carpeta plastica', 3.80),
('Borrador', 1.20),
('Agenda 2025', 15.50),
('Calculadora', 25.00),
('Marcadores', 8.90),
('Tijeras', 4.20),
('Pegante en barra', 2.00),
('Impresora', 350.00),
('Escritorio', 180.00),
('Silla Ergonomica', 220.00),
('Monitor 24 pulgadas', 520.00),
('Teclado Mecanico', 150.00),
('Audifonos Profesionales', 85.00),
('Chocolate en barra', 5.50),
('Galletas con chocolate', 3.20),
('Bebida con chocolate', 4.80),
('Crema de chocolate', 7.00),
('Pastel de chocolate', 12.50),
('Chocolate blanco', 6.00);
GO

SELECT * FROM Productos;

SELECT Nombre, Precio FROM Productos;

SELECT * FROM Productos WHERE Precio > 50;

SELECT * FROM Productos WHERE LOWER(Nombre) LIKE '%chocolate%';

SELECT Nombre, Precio FROM Productos ORDER BY Precio ASC;