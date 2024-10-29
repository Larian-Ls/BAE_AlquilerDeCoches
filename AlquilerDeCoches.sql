-- Larian Luis Scerbet
-- 28/10/2024

DROP DATABASE IF EXISTS AlquilerDeCoches; -- Eliminar la base de datos si existe una llamada igual
CREATE DATABASE IF NOT EXISTS AlquilerDeCoches; -- Crear la base de datos si no existe
USE AlquilerDeCoches; -- Usar la base de datos para introducir los siguientes ajustes

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS Cliente, -- Eliminar las tablas mencionadas si ya existen
                     Avalistas,
                     Reserva,
                     Coche_Preparado, 
                     Coche;

CREATE TABLE Cliente -- Crear tabla Cliente
(
  Codigo_cliente CHAR(9) NOT NULL, 
  DNI CHAR(9) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  TEL INT NOT NULL,
  PRIMARY KEY (Codigo_cliente) -- Definir Codigo_Cliente como clave primaria
);

CREATE TABLE Avalistas
(
  Codigo_cliente1 CHAR(9) NOT NULL,
  Codigo_cliente2 CHAR(9) NOT NULL,
  FOREIGN KEY (Codigo_cliente1) REFERENCES Cliente(Codigo_cliente),
  FOREIGN KEY (Codigo_cliente2) REFERENCES Cliente(Codigo_cliente)
);

CREATE TABLE Reserva
(
  ID CHAR(9) NOT NULL,
  Fecha_Inicio DATE NOT NULL,
  Fecga_Final DATE NOT NULL,
  Precio_Total FLOAT NOT NULL,
  Codigo_cliente CHAR(9) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (Codigo_cliente) REFERENCES Cliente(Codigo_cliente)
);

CREATE TABLE Coche_Preparado
(
  Litros_Gasolina FLOAT NOT NULL,
  Matricula_P CHAR(7) NOT NULL,
  ID CHAR(9) NOT NULL,
  PRIMARY KEY (Matricula_P),
  FOREIGN KEY (ID) REFERENCES Reserva(ID)
);

CREATE TABLE Coche
(
  Matricula CHAR(7) NOT NULL,
  Modelo VARCHAR(50) NOT NULL,
  Color VARCHAR(20) NOT NULL,
  Marca VARCHAR(20) NOT NULL,
  Precio_Alquiler_H FLOAT NOT NULL,
  PRIMARY KEY (Matricula),
  FOREIGN KEY (Matricula) REFERENCES Coche_Preparado(Matricula_P)
);