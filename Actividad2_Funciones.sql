USE ComercialAndesDB;
GO

--Limpieza
IF OBJECT_ID('dbo.fn_CalcularTotalGastadoCliente', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_CalcularTotalGastadoCliente;
GO

IF OBJECT_ID('dbo.fn_ObtenerOperacionesPorCliente', 'IF') IS NOT NULL
    DROP FUNCTION dbo.fn_ObtenerOperacionesPorCliente;
GO

--Calcular y devolver el monto acumulado en operaciones de un cliente.
CREATE FUNCTION dbo.fn_CalcularTotalGastadoCliente
(
    @ClienteID INT
)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @TotalGastado DECIMAL(12,2);

    SELECT @TotalGastado = ISNULL(SUM(TotalOperacion), 0.00)
    FROM dbo.Operaciones
    WHERE ClienteID = @ClienteID;

    RETURN @TotalGastado;
END;
GO

--Dar el detalle completo de operaciones para un cliente específico.

CREATE FUNCTION dbo.fn_ObtenerOperacionesPorCliente
(
    @ClienteID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.OperacionID,
        c.ClienteID,
        c.NombreCompleto AS Cliente,
        p.ProductoID,
        p.NombreProducto AS Producto,
        p.PrecioUnitario,
        o.Cantidad,
        o.TotalOperacion,
        o.FechaOperacion
    FROM dbo.Operaciones o
    INNER JOIN dbo.Clientes c ON o.ClienteID = c.ClienteID
    INNER JOIN dbo.Productos p ON o.ProductoID = p.ProductoID
    WHERE (@ClienteID IS NULL OR o.ClienteID = @ClienteID)
);
GO

-- Consulta de consumo
-- a.Consumo puntual de la función escalar (essquema en readme)
SELECT dbo.fn_CalcularTotalGastadoCliente(1) AS TotalGastado_Valeria;
SELECT dbo.fn_CalcularTotalGastadoCliente(3) AS TotalGastado_Lucia_SinCompras;
GO

-- b.Consumo de la función escalar integrada en una consulta sobre Clientes
SELECT
    c.ClienteID,
    c.NombreCompleto,
    c.Correo,
    dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) AS TotalAcumulado
FROM dbo.Clientes c
ORDER BY TotalAcumulado DESC;
GO

-- c.Consumo de la función escalar dentro de una cláusula WHERE (clientes con gasto mayor a 250)
SELECT
    c.ClienteID,
    c.NombreCompleto,
    dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) AS TotalAcumulado
FROM dbo.Clientes c
WHERE dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) > 250.00;
GO

-- d.Consumo directo de la función de tipo tabla en FROM (cliente con operaciones)
SELECT *
FROM dbo.fn_ObtenerOperacionesPorCliente(1);
GO

-- e. Consumo de la función de tipo tabla para un cliente sin operaciones (0 filas)
SELECT *
FROM dbo.fn_ObtenerOperacionesPorCliente(3);
GO

-- f. Consumo general aplicando filtros WHERE y ordenamiento ORDER BY
SELECT
    OperacionID,
    Cliente,
    Producto,
    Cantidad,
    TotalOperacion
FROM dbo.fn_ObtenerOperacionesPorCliente(NULL)
WHERE TotalOperacion >= 200.00
ORDER BY TotalOperacion DESC;
GO

-- g. Consumo de la función de tipo tabla combinada con otra tabla mediante JOIN
SELECT
    f.OperacionID,
    f.Cliente,
    f.Producto,
    f.Cantidad AS CantidadVendida,
    p.StockActual AS StockDisponible
FROM dbo.fn_ObtenerOperacionesPorCliente(1) f
INNER JOIN dbo.Productos p ON f.ProductoID = p.ProductoID;
GO