CREATE DATABASE DW_Ventas;
GO

USE DW_Ventas;
GO

CREATE TABLE Dim_Ubicacion (
    id_ubicacion INT PRIMARY KEY,
    pais VARCHAR(100),
    region VARCHAR(100),
    ciudad VARCHAR(100)
);

CREATE TABLE Dim_Producto (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(150),
    categoria VARCHAR(100),
    marca VARCHAR(100),
    precio_base DECIMAL(10,2),
    estado_producto VARCHAR(50)
);

CREATE TABLE Dim_Cliente (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(150),
    email VARCHAR(150),
    telefono VARCHAR(50),
    segmento_cliente VARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE Dim_Tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    nombre_mes VARCHAR(20),
    trimestre INT,
    anio INT
);

CREATE TABLE Dim_Sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre_sucursal VARCHAR(150),
    direccion VARCHAR(200)
);

CREATE TABLE Dim_Fuente_Datos (
    id_fuente INT PRIMARY KEY,
    nombre_fuente VARCHAR(100),
    tipo_fuente VARCHAR(50),
    descripcion_fuente VARCHAR(255)
);

CREATE TABLE Fact_Ventas (
    id_venta INT PRIMARY KEY,

    id_producto INT,
    id_cliente INT,
    id_tiempo INT,
    id_sucursal INT,
    id_ubicacion INT,
    id_fuente INT,

    cantidad INT,
    precio_unitario DECIMAL(10,2),
    total_venta DECIMAL(12,2),

    FOREIGN KEY (id_producto) REFERENCES Dim_Producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES Dim_Cliente(id_cliente),
    FOREIGN KEY (id_tiempo) REFERENCES Dim_Tiempo(id_tiempo),
    FOREIGN KEY (id_sucursal) REFERENCES Dim_Sucursal(id_sucursal),
    FOREIGN KEY (id_ubicacion) REFERENCES Dim_Ubicacion(id_ubicacion),
    FOREIGN KEY (id_fuente) REFERENCES Dim_Fuente_Datos(id_fuente)
);