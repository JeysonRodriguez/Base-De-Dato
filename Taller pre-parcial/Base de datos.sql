-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Mi_Base_De_Datos;

-- Usar la base de datos
USE Mi_Base_De_Datos;

-- Crear la tabla Sucursales
CREATE TABLE IF NOT EXISTS Sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    numero_cancha INT NOT NULL,
    dueno VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    capacidad INT NOT NULL,
    FechaCreacion DATE,
    email VARCHAR(255)
);

-- Crear la tabla Canchas
CREATE TABLE IF NOT EXISTS Canchas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tarifa DECIMAL(10, 2) NOT NULL,
    capacidad INT NOT NULL,
    id_sucursal INT,
    FechaCreacion DATE,
    Ciudad VARCHAR(255),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id)
);

-- Crear la tabla Deportes
CREATE TABLE IF NOT EXISTS Deportes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    imagen VARCHAR(255),
    icono VARCHAR(255),
    clasificacion VARCHAR(255),
    cancha_asociada INT,
    FOREIGN KEY (cancha_asociada) REFERENCES Canchas(id)
);

-- Crear la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    estado VARCHAR(255),
    perfil VARCHAR(255),
    correo VARCHAR(255),
    ultima_ingreso DATETIME,
    valor_dueño_sucursal DECIMAL(10, 2),
    edad INT NOT NULL
);

-- Crear la tabla Listado de Deportes Favoritos
CREATE TABLE IF NOT EXISTS Listado_Deportes_Favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    deporte VARCHAR(255) NOT NULL,
    usuario INT,
    descripcion VARCHAR(255),
    FOREIGN KEY (usuario) REFERENCES Usuarios(id)
);

-- Crear la tabla Forma de Pago
CREATE TABLE IF NOT EXISTS Forma_de_Pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(16) NOT NULL,
    cardholder_name VARCHAR(255) NOT NULL,
    cvc VARCHAR(3) NOT NULL,
    expiracion DATE NOT NULL,
    id_usuario INT,
    direccion_ip VARCHAR(15),
    score_riesgo DECIMAL(10, 2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

-- Datos en la tabla Sucursales 
INSERT INTO Sucursales (nombre, ubicacion, numero_cancha, dueno, telefono, capacidad, FechaCreacion, email)
VALUES
  ('Sucursal 1', 'Ubicación 1', 3, 'Dueño 1', '123-456-7890', 100, '2023-10-08', 'usuarioejemplo@gmail.com'),
  ('Sucursal 2', 'Ubicación 2', 4, 'Dueño 2', '987-654-3210', 150, '2023-10-09', 'ejemplodireccion@gmail.com'),
  ('Sucursal 3', 'Ubicación 3', 5, 'Dueño 3', '555-555-5555', 200, '2023-10-10', 'micorreoejemplo@gmail.com'),
  ('Sucursal 4', 'Ubicación 4', 3, 'Dueño 4', '123-456-7890', 100, '2023-10-11', 'ejemplodecorreo@gmail.com'),
  ('Sucursal 5', 'Ubicación 5', 4, 'Dueño 5', '987-654-3210', 150, '2023-10-12', 'correo.test@gmail.com'),
  ('Sucursal 6', 'Ubicación 6', 5, 'Dueño 6', '555-555-5555', 200, '2023-10-13', 'usuariodemo@gmail.com'),
  ('Sucursal 7', 'Ubicación 7', 3, 'Dueño 7', '123-456-7890', 100, '2023-10-14', 'correo7@sucursal7.com'),
  ('Sucursal 8', 'Ubicación 8', 4, 'Dueño 8', '987-654-3210', 150, '2023-10-15', 'correodeejemplo@gmail.com'),
  ('Sucursal 9', 'Ubicación 9', 5, 'Dueño 9', '555-555-5555', 200, '2023-10-16', 'correo9@sucursal9.com'),
  ('Sucursal 10', 'Ubicación 10', 3, 'Dueño 10', '123-456-7890', 100, '2023-10-17', 'correo10@sucursal10.com');

INSERT INTO Sucursales (nombre, ubicacion, numero_cancha, dueno, telefono, capacidad, FechaCreacion, email)
VALUES
  ('Sucursal 1', 'Ubicación 1', 3, 'Dueño 1', '123-456-7890', 100, '2023-10-08', 'usuarioejemplo@gmail.com');


-- Datos en la tabla Canchas
INSERT INTO Canchas (nombre, tarifa, capacidad, id_sucursal, FechaCreacion, Ciudad)
VALUES
    ('Cancha 1', 25.00, 50, 1, '2023-10-08', 'Ciudad A'),
    ('Cancha 2', 30.00, 40, 2, '2023-10-08', 'Ciudad B'),
    ('Cancha 3', 20.00, 60, 1, '2023-10-08', 'Ciudad A'),
    ('Cancha 4', 35.00, 45, 3, '2023-10-08', 'Ciudad C'),
    ('Cancha 5', 22.50, 55, 2, '2023-10-08', 'Ciudad B'),
    ('Cancha 6', 27.50, 48, 1, '2023-10-08', 'Ciudad A'),
    ('Cancha 7', 40.00, 38, 3, '2023-10-08', 'Ciudad C'),
    ('Cancha 8', 18.00, 70, 2, '2023-10-08', 'Ciudad B'),
    ('Cancha 9', 32.00, 42, 1, '2023-10-08', 'Ciudad A'),
    ('Cancha 10', 29.00, 47, 3, '2023-10-08', 'Ciudad C');


-- Datos en la tabla Deportes
INSERT INTO Deportes (nombre, apellido, email, tipo, imagen, icono, clasificacion, cancha_asociada)
VALUES
    ('Juan', 'Pérez', 'juan@gmail.com', 'Fútbol', 'imagen1.jpg', 'icono1.png', 'Clase A', 1),
    ('María', 'González', 'maria@gmail.com', 'Baloncesto', 'imagen2.jpg', 'icono2.png', 'Clase B', 2),
    ('Luis', 'Rodríguez', 'luis@gmail.com', 'Tenis', 'imagen3.jpg', 'icono3.png', 'Clase C', 1),
    ('Ana', 'García', 'ana@gmail.com', 'Fútbol', 'imagen4.jpg', 'icono4.png', 'Clase A', 3),
    ('Carlos', 'Martínez', 'carlos@gmail.com', 'Baloncesto', 'imagen5.jpg', 'icono5.png', 'Clase B', 2),
    ('Laura', 'Fernández', 'laura@gmail.com', 'Tenis', 'imagen6.jpg', 'icono6.png', 'Clase C', 1),
    ('José', 'Pérez', 'jose@gmail.com', 'Fútbol', 'imagen7.jpg', 'icono7.png', 'Clase A', 3),
    ('Sofía', 'Gómez', 'sofia@gmail.com', 'Baloncesto', 'imagen8.jpg', 'icono8.png', 'Clase B', 2),
    ('Manuel', 'Vargas', 'manuel@gmail.com', 'Tenis', 'imagen9.jpg', 'icono9.png', 'Clase C', 1),
    ('Elena', 'Ramírez', 'elena@gmail.com', 'Fútbol', 'imagen10.jpg', 'icono10.png', 'Clase A', 3);


-- Datos en la tabla "Usuarios"
INSERT INTO Usuarios (nombre, nombre_usuario, contrasena, estado, perfil, correo, ultima_ingreso, valor_dueño_sucursal, edad)
VALUES
    ('Juan Pérez', 'juanperez', 'contrasena123', 'Activo', 'Administrador', 'juan@gmail.com', '2023-10-08 10:30:00', 1500.00, 35),
    ('María González', 'mariagonzalez', 'password456', 'Inactivo', 'Usuario Normal', 'maria@gmail.com', '2023-10-07 15:45:00', 0.00, 28),
    ('Luis Rodríguez', 'luisrodriguez', 'clave789', 'Activo', 'Usuario Normal', 'luis@gmail.com', '2023-10-06 08:15:00', 0.00, 42),
    ('Ana García', 'anagarcia', 'miclave123', 'Inactivo', 'Usuario Normal', 'ana@gmail.com', '2023-10-05 12:20:00', 0.00, 29),
    ('Carlos Martínez', 'carlosmartinez', 'contraseña456', 'Activo', 'Usuario Normal', 'carlos@gmail.com', '2023-10-04 17:10:00', 0.00, 37),
    ('Laura Fernández', 'laurafernandez', 'pass1234', 'Activo', 'Usuario Normal', 'laura@gmail.com', '2023-10-03 09:55:00', 0.00, 24),
    ('Sofía Gómez', 'sofiagomez', 'miclave789', 'Activo', 'Usuario Normal', 'sofia@gmail.com', '2023-10-02 14:40:00', 0.00, 31),
    ('Pedro Díaz', 'pedrodiaz', 'password567', 'Activo', 'Usuario Normal', 'pedro@gmail.com', '2023-10-01 16:25:00', 0.00, 48),
    ('Elena Ramírez', 'elenaramirez', 'miotraclave123', 'Inactivo', 'Usuario Normal', 'elena@gmail.com', '2023-09-30 11:05:00', 0.00, 27),
    ('Manuel Vargas', 'manuelvargas', 'clave5678', 'Activo', 'Usuario Normal', 'manuel@gmail.com', '2023-09-29 13:50:00', 0.00, 39);

-- Datos en la tabla Listado_Deportes_Favoritos
INSERT INTO Listado_Deportes_Favoritos (nombre, deporte, usuario, descripcion)
VALUES
    ('Preferencia de Fútbol', 'Fútbol', 1, 'Mi deporte preferido es el fútbol'),
    ('Gusto por el Baloncesto', 'Baloncesto', 2, 'Me gusta el baloncesto'),
    ('Afición por el Tenis', 'Tenis', 3, 'Soy un aficionado al tenis'),
    ('Amor por el Fútbol', 'Fútbol', 4, 'Amo el fútbol'),
    ('Apasionado por el Baloncesto', 'Baloncesto', 5, 'Soy apasionado por el baloncesto'),
    ('Tenis Todo el Camino', 'Tenis', 6, 'El tenis es mi vida'),
    ('Fútbol Siempre', 'Fútbol', 7, 'Siempre disfruto el fútbol'),
    ('Baloncesto en mi Corazón', 'Baloncesto', 8, 'El baloncesto está en mi corazón'),
    ('Tenis en mi ADN', 'Tenis', 9, 'El tenis corre por mis venas'),
    ('Fútbol con Amigos', 'Fútbol', 10, 'Juego fútbol con amigos y diversión');

-- Datos en la tabla Forma_de_Pago
INSERT INTO Forma_de_Pago (card_number, cardholder_name, cvc, expiracion, id_usuario, direccion_ip, score_riesgo)
VALUES
    ('1234567890123456', 'Juan Pérez', '123', '2025-12-31', 1, '192.168.1.1', 0.95),
    ('9876543210987654', 'María González', '456', '2024-11-30', 2, '192.168.1.2', 0.75),
    ('1111222233334444', 'Luis Rodríguez', '789', '2023-10-31', 3, '192.168.1.3', 0.82),
    ('5555666677778888', 'Ana García', '321', '2025-09-30', 4, '192.168.1.4', 0.91),
    ('9999000011112222', 'Carlos Martínez', '654', '2024-08-31', 5, '192.168.1.5', 0.88),
    ('3333444455556666', 'Laura Fernández', '987', '2023-07-31', 6, '192.168.1.6', 0.72),
    ('7777888899990000', 'José Pérez', '456', '2025-06-30', 7, '192.168.1.7', 0.94),
    ('1234123412341234', 'Sofía Gómez', '321', '2024-05-31', 8, '192.168.1.8', 0.86),
    ('5678567856785678', 'Pedro Díaz', '789', '2023-04-30', 9, '192.168.1.9', 0.77),
    ('9876987698769876', 'Elena Ramírez', '654', '2025-03-31', 10, '192.168.1.10', 0.92);
   
   