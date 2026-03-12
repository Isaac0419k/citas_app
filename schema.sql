-- Script para crear la base de datos de EPS Citas
-- Ejecuta esto en tu MySQL (local o Railway)

CREATE DATABASE IF NOT EXISTS eps_citas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE eps_citas;

CREATE TABLE IF NOT EXISTS pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(150),
    eps VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS citas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) NOT NULL,
    medico VARCHAR(100) NOT NULL,
    tipo_cita VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    direccion_eps VARCHAR(200),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (documento) REFERENCES pacientes(documento) ON DELETE CASCADE
);
