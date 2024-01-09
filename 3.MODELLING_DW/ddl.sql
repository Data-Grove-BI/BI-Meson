-- Fact_Ventas
CREATE TABLE Fact_Ventas (
    id INT PRIMARY KEY,
    id_hticket INT,
    id_fecha INT,
    cantidad DECIMAL(5, 1),
    precio_unitario DECIMAL(5, 1),
    total DECIMAL(10, 2),
    FOREIGN KEY (id_hticket) REFERENCES Dim_HTickets(id_hticket),
    FOREIGN KEY (id_fecha) REFERENCES Dim_Fechas(id_fecha)
);

-- Fact_Cierres
CREATE TABLE Fact_Cierres (
    id INT PRIMARY KEY,
    id_fecha INT,
    efectivo DECIMAL(10, 2),
    saldo DECIMAL(10, 2),
    FOREIGN KEY (id_fecha) REFERENCES Dim_Fechas(id_fecha)
);

-- Dimensiones

-- Dim_Fechas
CREATE TABLE Dim_Fechas (
    id_fecha INT PRIMARY KEY,
    fecha DATE,
    year_file INT
);

-- Dim_HTickets
CREATE TABLE Dim_HTickets (
    id_hticket INT PRIMARY KEY,
    numcaj VARCHAR(20),
    fecha DATE,
    year_file INT
);

-- Dim_HLITICKET
CREATE TABLE Dim_HLITICKET (
    id_hliticket INT PRIMARY KEY,
    numtic INT,
    numcaj INT,
    codigo DECIMAL(5, 1),
    descri VARCHAR(255),
    cantidad DECIMAL(5, 1),
    precio DECIMAL(5, 1),
    year_file INT
);
