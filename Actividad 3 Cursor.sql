USE ComercialAndesDB;
GO

DECLARE @ClienteID INT;
DECLARE @NombreCliente VARCHAR(120);
DECLARE @TotalGastado DECIMAL(12,2);
DECLARE @Clasificacion VARCHAR(30);


IF OBJECT_ID('tempdb..#ResultadoCursorClientes') IS NOT NULL
    DROP TABLE #ResultadoCursorClientes;

CREATE TABLE #ResultadoCursorClientes (
    ClienteID INT,
    NombreCliente VARCHAR(120),
    TotalGastado DECIMAL(12,2),
    Clasificacion VARCHAR(30)
);

DECLARE cur_ResumenClientes CURSOR LOCAL FAST_FORWARD FOR
    SELECT
        c.ClienteID,
        c.NombreCompleto,
        ISNULL(SUM(o.TotalOperacion), 0.00) AS TotalGastado
    FROM dbo.Clientes c
    LEFT JOIN dbo.Operaciones o ON c.ClienteID = o.ClienteID
    GROUP BY c.ClienteID, c.NombreCompleto
    ORDER BY c.ClienteID;

OPEN cur_ResumenClientes;

FETCH NEXT FROM cur_ResumenClientes INTO @ClienteID, @NombreCliente, @TotalGastado;

WHILE @@FETCH_STATUS = 0
BEGIN
    
    IF @TotalGastado >= 300.00
        SET @Clasificacion = 'Cliente Frecuente / Alto';
    ELSE IF @TotalGastado > 0.00
        SET @Clasificacion = 'Cliente Activo';
    ELSE
        SET @Clasificacion = 'Sin Compras Registradas';

    INSERT INTO #ResultadoCursorClientes (ClienteID, NombreCliente, TotalGastado, Clasificacion)
    VALUES (@ClienteID, @NombreCliente, @TotalGastado, @Clasificacion);

    FETCH NEXT FROM cur_ResumenClientes INTO @ClienteID, @NombreCliente, @TotalGastado;
END;

CLOSE cur_ResumenClientes;
DEALLOCATE cur_ResumenClientes;

SELECT
    ClienteID,
    NombreCliente,
    TotalGastado,
    Clasificacion
FROM #ResultadoCursorClientes
ORDER BY TotalGastado DESC;
GO 

SELECT
    c.ClienteID,
    c.NombreCompleto AS NombreCliente,
    dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) AS TotalGastado,
    CASE
        WHEN dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) >= 300.00 THEN 'Cliente Frecuente / Alto'
        WHEN dbo.fn_CalcularTotalGastadoCliente(c.ClienteID) > 0.00 THEN 'Cliente Activo'
        ELSE 'Sin Compras Registradas'
    END AS Clasificacion
FROM dbo.Clientes c
ORDER BY TotalGastado DESC;
GO