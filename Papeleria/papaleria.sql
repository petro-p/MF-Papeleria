-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE papeleria;
USE papeleria;


-- TABLA DE INVENTARIO/STOCK
CREATE TABLE IF NOT EXISTS `stock` (
    `inv_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `precio` DOUBLE(6,2) NOT NULL,
    `numStock` INT(3) NOT NULL
);

-- TABLA DE PROVEEDORES
CREATE TABLE IF NOT EXISTS `proveedores` (
    `nif` VARCHAR(20) PRIMARY KEY,
    `nombre` VARCHAR(40) NOT NULL,
    `paises` VARCHAR(20) NOT NULL,
    `telefono` VARCHAR(20) NOT NULL,
    `direccion` VARCHAR(25) NOT NULL,
    `email` VARCHAR(40) NOT NULL UNIQUE
);

-- TABLA DE CLIENTES
CREATE TABLE IF NOT EXISTS `clientes` (
    `cliente_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `dni` VARCHAR(15) NOT NULL UNIQUE,
    `nombre` VARCHAR(20) NOT NULL,
    `apellidos` VARCHAR(40) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL,
    `poblacion` VARCHAR(20) NOT NULL DEFAULT 'Palma',
    `codpostal` VARCHAR(5) NOT NULL,
    `movil` VARCHAR(15) NOT NULL,
    `email` VARCHAR(40) NOT NULL UNIQUE
);

-- TABLA DE TRANSACCIONES O VENTAS
CREATE TABLE IF NOT EXISTS `transacciones` (
    `transaccion_id` INTEGER UNSIGNED AUTO_INCREMENT,
    `cliente` INT(10) UNSIGNED,
    `fechaCreacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `precio_compra` DOUBLE(6,2) NOT NULL,
    `stock` INT(3) NOT NULL,
    `comentarios` VARCHAR(20),
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (transaccion_id) REFERENCES clientes(cliente_id)
);
