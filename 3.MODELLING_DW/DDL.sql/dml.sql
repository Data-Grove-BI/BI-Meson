-- Insertando datos en Dim_Fechas desde cierres
INSERT INTO Dim_Fechas (id_fecha, fecha, year_file)
SELECT DISTINCT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY FECHA)) AS id_fecha,
                FECHA,
                year_file
FROM cierres;

-- Insertando datos en Dim_HTickets desde htickets
INSERT INTO Dim_HTickets (id_hticket, numcaj, fecha, year_file)
SELECT DISTINCT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY NUMCAJ)) AS id_hticket,
                NUMCAJ,
                FECHA,
                year_file
FROM htickets;

-- Insertando datos en Dim_HLITICKET desde HLITICKET
INSERT INTO Dim_HLITICKET (id_hliticket, numtic, numcaj, codigo, descri, cantidad, precio, year_file)
SELECT DISTINCT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY NUMTIC)) AS id_hliticket,
                NUMTIC,
                NUMCAJ,
                CODIGO,
                DESCRI,
                CANTIDAD,
                PRECIO,
                year_file
FROM HLITICKET;

-- Insertando datos en Fact_Ventas desde HLITICKET
INSERT INTO Fact_Ventas (id, id_hticket, id_fecha, cantidad, precio_unitario, total)
SELECT DISTINCT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY NUMTIC)) AS id,
                CONVERT(INT, ROW_NUMBER() OVER (ORDER BY NUMCAJ)) AS id_hticket,
                CONVERT(INT, ROW_NUMBER() OVER (ORDER BY FECHA)) AS id_fecha,
                CANTIDAD,
                PRECIO,
                CANTIDAD * PRECIO AS total
FROM HLITICKET;

-- Insertando datos en Fact_Cierres desde cierres
INSERT INTO Fact_Cierres (id, id_fecha, efectivo, saldo)
SELECT DISTINCT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY FECHA)) AS id,
                CONVERT(INT, ROW_NUMBER() OVER (ORDER BY FECHA)) AS id_fecha,
                EFECTIVO,
                SALDO
FROM cierres;
