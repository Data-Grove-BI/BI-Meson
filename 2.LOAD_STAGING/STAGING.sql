CREATE TABLE cierres ( 
    FECHA DATE,
    HORA TIME,
    EFECTIVO DECIMAL(10, 2),
    SALDO DECIMAL(10, 2),
    year_file INT,
    PRIMARY KEY CLUSTERED(FECHA,year_file) 
);


CREATE TABLE HLITICKET ( 
    NUMTIC INT,
    NUMCAJ INT,
    CODIGO DECIMAL(5, 1),
    DESCRI VARCHAR(255),
    CANTIDAD DECIMAL(5, 1),
    PRECIO DECIMAL(5, 1),
    year_file INT,
    PRIMARY KEY CLUSTERED(NUMCAJ,CODIGO,DESCRI,year_file)     
);


CREATE TABLE htickets ( 
    NUMCAJ VARCHAR(20),
    FECHA DATE,
    year_file INT,
    PRIMARY KEY CLUSTERED(NUMCAJ,year_file) 
);

--      htickets    ----> HLITICKET ---->   cierres

htickets    ----> HLITICKET    (NUMCAJ,year_file)
htickets ---->   cierres       (FECHA)
