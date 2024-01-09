-- Creating htickets table
CREATE TABLE htickets ( 
    NUMCAJ VARCHAR(20),
    FECHA DATE,
    year_file INT,
    PRIMARY KEY CLUSTERED(NUMCAJ, year_file) 
);

-- Creating HLITICKET table
CREATE TABLE HLITICKET ( 
    NUMTIC INT,
    NUMCAJ INT,
    CODIGO DECIMAL(5, 1),
    DESCRI VARCHAR(255),
    CANTIDAD DECIMAL(5, 1),
    PRECIO DECIMAL(5, 1),
    year_file INT,
    PRIMARY KEY CLUSTERED(NUMCAJ, CODIGO, DESCRI, year_file),
    FOREIGN KEY (NUMCAJ, year_file) REFERENCES htickets(NUMCAJ, year_file)
);

-- Creating cierres table with foreign key constraint
CREATE TABLE cierres ( 
    FECHA DATE,
    HORA TIME,
    EFECTIVO DECIMAL(10, 2),
    SALDO DECIMAL(10, 2),
    year_file INT,
    PRIMARY KEY CLUSTERED(FECHA, year_file),
    FOREIGN KEY (FECHA, year_file) REFERENCES htickets(FECHA, year_file)
);


--      htickets    ----> HLITICKET ---->   cierres

htickets    ----> HLITICKET    (NUMCAJ,year_file)
htickets ---->   cierres       (FECHA)


SELECT
    ht.NUMCAJ,
    ht.FECHA,
    ht.year_file,
    hlt.NUMTIC,
    hlt.CODIGO,
    hlt.DESCRI,
    hlt.CANTIDAD,
    hlt.PRECIO,
    c.FECHA AS CierreFecha,
    c.HORA,
    c.EFECTIVO,
    c.SALDO
FROM
    htickets ht
JOIN
    HLITICKET hlt ON ht.NUMCAJ = hlt.NUMCAJ AND ht.year_file = hlt.year_file
LEFT JOIN
    cierres c ON ht.FECHA = c.FECHA
ORDER BY
    ht.NUMCAJ, ht.FECHA, hlt.NUMTIC;
