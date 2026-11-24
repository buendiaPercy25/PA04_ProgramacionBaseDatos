USE ComercialAndesDB;
GO

-- Revisar stock antes de probar (Producto 3 tiene 12 unidades)
SELECT ProductoID, NombreProducto, StockActual FROM Productos WHERE ProductoID = 3;

-- 1. Probar INSERT (inserta 2 unidades del Producto 3 -> Stock debe bajar de 12 a 10)
INSERT INTO Operaciones (ClienteID, ProductoID, Cantidad, TotalOperacion)
VALUES (1, 3, 2, 1300.00);

-- Capturamos el ID de la operación insertada justo después del INSERT
DECLARE @UltimaOp INT = SCOPE_IDENTITY();

SELECT ProductoID, NombreProducto, StockActual FROM Productos WHERE ProductoID = 3;
SELECT TOP 1 * FROM AuditoriaOperaciones ORDER BY AuditoriaID DESC;

-- 2. Probar UPDATE sobre esa operación (cambia cantidad de 2 a 4 -> Stock baja de 10 a 8)
UPDATE Operaciones
SET Cantidad = 4, TotalOperacion = 2600.00
WHERE OperacionID = @UltimaOp;

SELECT ProductoID, NombreProducto, StockActual FROM Productos WHERE ProductoID = 3;
SELECT TOP 1 * FROM AuditoriaOperaciones ORDER BY AuditoriaID DESC;

-- 3. Probar DELETE sobre esa operación (elimina la operación -> Stock sube de 8 a 12)
DELETE FROM Operaciones
WHERE OperacionID = @UltimaOp;

SELECT ProductoID, NombreProducto, StockActual FROM Productos WHERE ProductoID = 3;
SELECT * FROM AuditoriaOperaciones;
GO