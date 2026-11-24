USE ComercialAndesDB;
GO

-- Tabla de auditoría para registrar los cambios detectados en Operaciones
CREATE TABLE AuditoriaOperaciones (
    AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
    OperacionID INT NOT NULL,
    TipoCambio VARCHAR(20) NOT NULL, 
    ProductoID INT NOT NULL,
    CantidadAnterior INT NULL,
    CantidadNueva INT NULL,
    DescripcionCambio VARCHAR(250) NOT NULL,
    FechaCambio DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- Desencadenante AFTER INSERT (usa inserted)
CREATE TRIGGER trg_Operaciones_AfterInsert
ON Operaciones
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Descontamos  el stock según las filas insertadas
    UPDATE p
    SET p.StockActual = p.StockActual - i.Cantidad
    FROM Productos p
    INNER JOIN inserted i ON p.ProductoID = i.ProductoID;

    -- REgistra la inserción en auditoría
    INSERT INTO AuditoriaOperaciones (
        OperacionID, TipoCambio, ProductoID, CantidadAnterior, CantidadNueva, DescripcionCambio
    )
    SELECT 
        i.OperacionID,
        'INSERT',
        i.ProductoID,
        NULL,
        i.Cantidad,
        'Nueva operación registrada; stock descontado en ' + CAST(i.Cantidad AS VARCHAR(10)) + ' unidad(es).'
    FROM inserted i;
END;
GO

-- Desencadenante AFTER UPDATE (usa deleted e inserted)
CREATE TRIGGER trg_Operaciones_AfterUpdate
ON Operaciones
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Ajusta el stock por la diferencia entre cantidad nueva (inserted) y anterior (deleted)
    UPDATE p
    SET p.StockActual = p.StockActual - (i.Cantidad - d.Cantidad)
    FROM Productos p
    INNER JOIN inserted i ON p.ProductoID = i.ProductoID
    INNER JOIN deleted d ON i.OperacionID = d.OperacionID;

    -- Registra la actualización en auditoría
    INSERT INTO AuditoriaOperaciones (
        OperacionID, TipoCambio, ProductoID, CantidadAnterior, CantidadNueva, DescripcionCambio
    )
    SELECT 
        i.OperacionID,
        'UPDATE',
        i.ProductoID,
        d.Cantidad,
        i.Cantidad,
        'Operación actualizada de ' + CAST(d.Cantidad AS VARCHAR(10)) + ' a ' + CAST(i.Cantidad AS VARCHAR(10)) + ' unidad(es).'
    FROM inserted i
    INNER JOIN deleted d ON i.OperacionID = d.OperacionID;
END;
GO

--  Desencadenante AFTER DELETE (usa deleted)
CREATE TRIGGER trg_Operaciones_AfterDelete
ON Operaciones
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Devuelve el stock eliminado a Productos
    UPDATE p
    SET p.StockActual = p.StockActual + d.Cantidad
    FROM Productos p
    INNER JOIN deleted d ON p.ProductoID = d.ProductoID;

    -- Registra la eliminación en auditoría
    INSERT INTO AuditoriaOperaciones (
        OperacionID, TipoCambio, ProductoID, CantidadAnterior, CantidadNueva, DescripcionCambio
    )
    SELECT 
        d.OperacionID,
        'DELETE',
        d.ProductoID,
        d.Cantidad,
        NULL,
        'Operación eliminada; se repusieron ' + CAST(d.Cantidad AS VARCHAR(10)) + ' unidad(es) al stock.'
    FROM deleted d;
END;
GO