-- =====================================================================
-- CONMAQUEL SYSTEM — Script de base de datos
-- Centro Electrónico Conmaquel Ingenieros E.I.R.L.
-- Motor: MySQL 8.0+  |  Charset: utf8mb4  |  Motor de tablas: InnoDB
-- Corresponde al modelo entidad-relación descrito en docs/10-modelo-er.md
-- =====================================================================

DROP DATABASE IF EXISTS conmaquel_db;
CREATE DATABASE conmaquel_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE conmaquel_db;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================================
-- 1. ROL Y PERMISOS
-- =====================================================================

CREATE TABLE rol (
  id_rol       INT AUTO_INCREMENT PRIMARY KEY,
  nombre       VARCHAR(60)  NOT NULL UNIQUE,
  descripcion  VARCHAR(255) DEFAULT NULL,
  estado       ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
  creado_en    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE permiso (
  id_permiso   INT AUTO_INCREMENT PRIMARY KEY,
  id_rol       INT NOT NULL,
  modulo       VARCHAR(60) NOT NULL,   -- usuarios, productos, categorias, inventario, reservas, ventas, clientes, reportes, configuracion
  ver          TINYINT(1) NOT NULL DEFAULT 0,
  crear        TINYINT(1) NOT NULL DEFAULT 0,
  editar       TINYINT(1) NOT NULL DEFAULT 0,
  eliminar     TINYINT(1) NOT NULL DEFAULT 0,
  CONSTRAINT fk_permiso_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
    ON UPDATE CASCADE ON DELETE CASCADE,
  UNIQUE KEY uq_permiso_rol_modulo (id_rol, modulo)
) ENGINE=InnoDB;

-- =====================================================================
-- 2. USUARIOS (personal interno del sistema)
-- =====================================================================

CREATE TABLE usuario (
  id_usuario      INT AUTO_INCREMENT PRIMARY KEY,
  nombres         VARCHAR(80)  NOT NULL,
  apellidos       VARCHAR(80)  NOT NULL,
  dni             VARCHAR(8)   DEFAULT NULL,
  correo          VARCHAR(120) NOT NULL UNIQUE,
  telefono        VARCHAR(20)  DEFAULT NULL,
  usuario         VARCHAR(40)  NOT NULL UNIQUE,
  contrasena_hash VARCHAR(255) NOT NULL,        -- RNF-05: contraseñas cifradas (password_hash de PHP)
  id_rol          INT NOT NULL,
  foto            VARCHAR(255) DEFAULT NULL,
  estado          ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
  ultimo_acceso   DATETIME DEFAULT NULL,
  creado_en       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =====================================================================
-- 3. CATEGORÍAS Y PRODUCTOS
-- =====================================================================

CREATE TABLE categoria (
  id_categoria  INT AUTO_INCREMENT PRIMARY KEY,
  nombre        VARCHAR(80)  NOT NULL UNIQUE,
  descripcion   VARCHAR(255) DEFAULT NULL,
  icono         VARCHAR(60)  DEFAULT NULL,       -- clase de Font Awesome, ej. fa-video
  estado        ENUM('activa','inactiva') NOT NULL DEFAULT 'activa',
  creado_en     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE producto (
  id_producto     INT AUTO_INCREMENT PRIMARY KEY,
  sku             VARCHAR(30)  NOT NULL UNIQUE,
  nombre          VARCHAR(150) NOT NULL,
  descripcion     TEXT DEFAULT NULL,
  id_categoria    INT NOT NULL,
  tipo            ENUM('venta','servicio_tecnico') NOT NULL DEFAULT 'venta',
  precio          DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  stock_minimo    INT NOT NULL DEFAULT 0,
  requiere_lote   TINYINT(1) NOT NULL DEFAULT 0,  -- 1 = aplica control FIFO por vencimiento
  imagen          VARCHAR(255) DEFAULT NULL,
  estado          ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
  creado_en       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  INDEX idx_producto_nombre (nombre),
  INDEX idx_producto_sku (sku)
) ENGINE=InnoDB;

-- =====================================================================
-- 4. PROVEEDORES E INVENTARIO (lotes + kardex)
-- =====================================================================

CREATE TABLE proveedor (
  id_proveedor  INT AUTO_INCREMENT PRIMARY KEY,
  razon_social  VARCHAR(150) NOT NULL,
  ruc           VARCHAR(11)  DEFAULT NULL,
  telefono      VARCHAR(20)  DEFAULT NULL,
  correo        VARCHAR(120) DEFAULT NULL,
  estado        ENUM('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;

CREATE TABLE lote_inventario (
  id_lote            INT AUTO_INCREMENT PRIMARY KEY,
  id_producto        INT NOT NULL,
  numero_lote        VARCHAR(40) NOT NULL,
  fecha_ingreso      DATE NOT NULL,
  fecha_vencimiento  DATE DEFAULT NULL,           -- NULL si el producto no maneja vencimiento
  costo_unitario     DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  cantidad_inicial   INT NOT NULL,
  cantidad_actual    INT NOT NULL,                -- se actualiza vía trigger con cada movimiento
  id_proveedor       INT DEFAULT NULL,
  creado_en          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_lote_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_lote_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
    ON UPDATE CASCADE ON DELETE SET NULL,
  INDEX idx_lote_vencimiento (fecha_vencimiento),
  INDEX idx_lote_producto (id_producto)
) ENGINE=InnoDB;

CREATE TABLE movimiento_inventario (
  id_movimiento        INT AUTO_INCREMENT PRIMARY KEY,
  id_lote              INT NOT NULL,
  tipo                 ENUM('entrada','salida') NOT NULL,
  motivo               VARCHAR(60) NOT NULL,   -- compra, devolucion, ajuste, transferencia, venta, servicio_tecnico, merma
  cantidad             INT NOT NULL,
  documento_referencia VARCHAR(60) DEFAULT NULL,
  id_usuario           INT NOT NULL,
  fecha                DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  observaciones        VARCHAR(255) DEFAULT NULL,
  CONSTRAINT fk_movimiento_lote FOREIGN KEY (id_lote) REFERENCES lote_inventario(id_lote)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_movimiento_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  INDEX idx_movimiento_fecha (fecha),
  INDEX idx_movimiento_lote (id_lote)
) ENGINE=InnoDB;

-- =====================================================================
-- 5. CLIENTES
-- =====================================================================

CREATE TABLE cliente (
  id_cliente            INT AUTO_INCREMENT PRIMARY KEY,
  tipo_cliente          ENUM('natural','empresa') NOT NULL DEFAULT 'natural',
  nombres_razon_social  VARCHAR(150) NOT NULL,
  tipo_documento        ENUM('DNI','RUC','CE') NOT NULL DEFAULT 'DNI',
  num_documento         VARCHAR(15) NOT NULL,
  correo                VARCHAR(120) DEFAULT NULL,
  telefono              VARCHAR(20)  DEFAULT NULL,
  direccion             VARCHAR(200) DEFAULT NULL,
  canal_origen          VARCHAR(60)  DEFAULT 'Tienda física',
  estado                ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
  creado_en             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_cliente_documento (tipo_documento, num_documento),
  INDEX idx_cliente_nombre (nombres_razon_social)
) ENGINE=InnoDB;

-- =====================================================================
-- 6. RESERVAS Y SERVICIO TÉCNICO
-- =====================================================================

CREATE TABLE reserva (
  id_reserva          INT AUTO_INCREMENT PRIMARY KEY,
  codigo              VARCHAR(20) NOT NULL UNIQUE,   -- ej. RSV-1042
  id_cliente          INT NOT NULL,
  tipo_servicio       VARCHAR(120) NOT NULL,         -- ej. "Instalación de cámaras CCTV"
  fecha               DATE NOT NULL,
  hora                TIME NOT NULL,
  estado              ENUM('pendiente','confirmada','cancelada') NOT NULL DEFAULT 'pendiente',
  id_usuario_aprueba  INT DEFAULT NULL,
  total_estimado      DECIMAL(10,2) DEFAULT NULL,
  creado_en           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_reserva_usuario_aprueba FOREIGN KEY (id_usuario_aprueba) REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE ON DELETE SET NULL,
  INDEX idx_reserva_fecha (fecha),
  INDEX idx_reserva_estado (estado)
) ENGINE=InnoDB;

CREATE TABLE servicio_tecnico (
  id_servicio        INT AUTO_INCREMENT PRIMARY KEY,
  id_reserva         INT NOT NULL,
  id_tecnico         INT DEFAULT NULL,
  descripcion        TEXT DEFAULT NULL,
  materiales_usados  TEXT DEFAULT NULL,
  estado             ENUM('pendiente','en_proceso','completado') NOT NULL DEFAULT 'pendiente',
  fecha_inicio       DATETIME DEFAULT NULL,
  fecha_fin          DATETIME DEFAULT NULL,
  CONSTRAINT fk_servicio_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_servicio_tecnico_usuario FOREIGN KEY (id_tecnico) REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

-- =====================================================================
-- 7. VENTAS
-- =====================================================================

CREATE TABLE venta (
  id_venta      INT AUTO_INCREMENT PRIMARY KEY,
  codigo        VARCHAR(20) NOT NULL UNIQUE,     -- ej. #00231
  id_cliente    INT DEFAULT NULL,                -- NULL = cliente genérico
  id_usuario    INT NOT NULL,                    -- vendedor que registra
  fecha         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  subtotal      DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  igv           DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  total         DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  metodo_pago   ENUM('efectivo','tarjeta','yape_plin') NOT NULL DEFAULT 'efectivo',
  estado        ENUM('pagado','anulado') NOT NULL DEFAULT 'pagado',
  CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
    ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_venta_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  INDEX idx_venta_fecha (fecha)
) ENGINE=InnoDB;

CREATE TABLE detalle_venta (
  id_detalle       INT AUTO_INCREMENT PRIMARY KEY,
  id_venta         INT NOT NULL,
  id_producto      INT NOT NULL,
  id_lote          INT DEFAULT NULL,             -- lote FIFO descontado (si el producto lo requiere)
  cantidad         INT NOT NULL,
  precio_unitario  DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES venta(id_venta)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_detalle_lote FOREIGN KEY (id_lote) REFERENCES lote_inventario(id_lote)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================================
-- 8. TRIGGERS — actualización automática de stock por lote (RF-04)
-- =====================================================================

DELIMITER $$

CREATE TRIGGER trg_movimiento_after_insert
AFTER INSERT ON movimiento_inventario
FOR EACH ROW
BEGIN
  IF NEW.tipo = 'entrada' THEN
    UPDATE lote_inventario
       SET cantidad_actual = cantidad_actual + NEW.cantidad
     WHERE id_lote = NEW.id_lote;
  ELSE
    UPDATE lote_inventario
       SET cantidad_actual = cantidad_actual - NEW.cantidad
     WHERE id_lote = NEW.id_lote;
  END IF;
END$$

DELIMITER ;

-- =====================================================================
-- 9. VISTAS DE APOYO
-- =====================================================================

-- Stock actual por producto (suma de todos sus lotes)
CREATE OR REPLACE VIEW vista_stock_producto AS
SELECT
  p.id_producto,
  p.sku,
  p.nombre,
  c.nombre AS categoria,
  p.precio,
  p.stock_minimo,
  COALESCE(SUM(l.cantidad_actual), 0) AS stock_actual,
  CASE
    WHEN COALESCE(SUM(l.cantidad_actual), 0) = 0 THEN 'sin_stock'
    WHEN COALESCE(SUM(l.cantidad_actual), 0) <= p.stock_minimo THEN 'stock_bajo'
    ELSE 'normal'
  END AS estado_stock
FROM producto p
LEFT JOIN categoria c ON c.id_categoria = p.id_categoria
LEFT JOIN lote_inventario l ON l.id_producto = p.id_producto
GROUP BY p.id_producto, p.sku, p.nombre, c.nombre, p.precio, p.stock_minimo;

-- Lotes próximos a vencer (alerta a 30 días, según RNF definido en 10-modelo-er.md)
CREATE OR REPLACE VIEW vista_alertas_vencimiento AS
SELECT
  l.id_lote,
  p.nombre AS producto,
  l.numero_lote,
  l.fecha_vencimiento,
  l.cantidad_actual,
  DATEDIFF(l.fecha_vencimiento, CURDATE()) AS dias_para_vencer
FROM lote_inventario l
JOIN producto p ON p.id_producto = l.id_producto
WHERE l.fecha_vencimiento IS NOT NULL
  AND l.cantidad_actual > 0
  AND DATEDIFF(l.fecha_vencimiento, CURDATE()) <= 30
ORDER BY l.fecha_vencimiento ASC;

-- Kardex detallado por producto (para 10-modelo-er.md / módulo inventario-kardex.html)
CREATE OR REPLACE VIEW vista_kardex AS
SELECT
  m.id_movimiento,
  m.fecha,
  p.nombre AS producto,
  p.sku,
  l.numero_lote,
  m.tipo,
  m.motivo,
  m.documento_referencia,
  m.cantidad,
  l.costo_unitario,
  (m.cantidad * l.costo_unitario) AS valor_movimiento,
  u.nombres AS registrado_por
FROM movimiento_inventario m
JOIN lote_inventario l ON l.id_lote = m.id_lote
JOIN producto p ON p.id_producto = l.id_producto
JOIN usuario u ON u.id_usuario = m.id_usuario
ORDER BY m.fecha DESC;

-- =====================================================================
-- 10. DATOS DE PRUEBA (seed) — coherentes con el prototipo HTML
-- =====================================================================

-- Roles
INSERT INTO rol (nombre, descripcion) VALUES
('Administrador', 'Acceso total al sistema'),
('Ventas y atención', 'Gestiona ventas, reservas y clientes'),
('Servicio técnico', 'Gestiona órdenes de servicio y repuestos'),
('Almacén', 'Gestiona inventario, entradas y salidas');

-- Permisos por rol (módulo: ver, crear, editar, eliminar)
INSERT INTO permiso (id_rol, modulo, ver, crear, editar, eliminar) VALUES
-- Administrador: acceso total
(1,'usuarios',1,1,1,1), (1,'productos',1,1,1,1), (1,'categorias',1,1,1,1),
(1,'inventario',1,1,1,1), (1,'reservas',1,1,1,1), (1,'ventas',1,1,1,1),
(1,'clientes',1,1,1,1), (1,'reportes',1,0,0,0), (1,'configuracion',1,1,1,1),
-- Ventas y atención
(2,'productos',1,0,0,0), (2,'categorias',1,0,0,0), (2,'inventario',1,0,0,0),
(2,'reservas',1,1,1,0), (2,'ventas',1,1,0,0), (2,'clientes',1,1,1,0), (2,'reportes',1,0,0,0),
-- Servicio técnico
(3,'productos',1,0,0,0), (3,'inventario',1,0,0,0), (3,'reservas',1,0,1,0),
-- Almacén
(4,'productos',1,0,0,0), (4,'inventario',1,1,1,0);

-- Usuarios (contraseñas de ejemplo: usar password_hash() real en la aplicación PHP)
INSERT INTO usuario (nombres, apellidos, dni, correo, telefono, usuario, contrasena_hash, id_rol, estado) VALUES
('Rosa', 'Salazar Injante', '45209871', 'rosa.salazar@conmaquel.com', '987654321', 'rsalazar', '$2y$10$examplehash1', 1, 'activo'),
('Jaime', 'Huaytalla Pariona', '41556230', 'jaime.huaytalla@conmaquel.com', '964123456', 'jhuaytalla', '$2y$10$examplehash2', 1, 'activo'),
('Marisol', 'Quiroz Alanya', '45892013', 'marisol.quiroz@conmaquel.com', '987654322', 'mquiroz', '$2y$10$examplehash3', 2, 'activo'),
('José', 'Huamán Rojas', '41220987', 'jose.huaman@conmaquel.com', '953112004', 'jhuaman', '$2y$10$examplehash4', 3, 'activo'),
('Lucía', 'Fernández Solís', '47890112', 'lucia.fernandez@conmaquel.com', '998340112', 'lfernandez', '$2y$10$examplehash5', 4, 'inactivo');

-- Categorías
INSERT INTO categoria (nombre, descripcion, icono) VALUES
('Seguridad electrónica', 'Cámaras CCTV, alarmas, control de acceso e intercomunicadores', 'fa-video'),
('Informática', 'Laptops, computadoras, componentes y redes', 'fa-laptop'),
('Electrónica general', 'Baterías, cables, fuentes de poder y componentes electrónicos', 'fa-plug-circle-bolt'),
('Repuestos y accesorios', 'Piezas de repuesto, fundas, adaptadores y consumibles', 'fa-plug'),
('Servicio técnico', 'Instalación, mantenimiento y reparación de equipos', 'fa-screwdriver-wrench');

-- Proveedores
INSERT INTO proveedor (razon_social, ruc, telefono, correo) VALUES
('Hikvision Perú S.A.C.', '20601987001', '014567890', 'ventas@hikvision.pe'),
('TP-Link Distribuidor Oficial', '20601987002', '014567891', 'contacto@tplink-pe.com'),
('Importadora Andina E.I.R.L.', '20601987003', '014567892', 'compras@andina.com.pe');

-- Productos
INSERT INTO producto (sku, nombre, descripcion, id_categoria, tipo, precio, stock_minimo, requiere_lote) VALUES
('CQ-SEG-0231', 'Cámara de seguridad IP 4MP', 'Visión nocturna, detección de movimiento', 1, 'venta', 189.00, 30, 0),
('CQ-SEG-0089', 'Kit de alarma inalámbrica 8 zonas', 'Incluye sensores de puerta y control remoto', 1, 'venta', 320.00, 10, 0),
('CQ-INF-0089', 'Laptop Lenovo IdeaPad 15" i5', '8GB RAM, 256GB SSD, Windows 11', 2, 'venta', 2450.00, 3, 0),
('CQ-INF-0057', 'Disco duro externo 2TB Seagate', 'USB 3.0, compatible con PC y Mac', 2, 'venta', 320.00, 8, 0),
('CQ-ELE-0142', 'Router Wi-Fi Mesh AC1200', 'Cobertura de hasta 150m²', 3, 'venta', 150.00, 15, 0),
('CQ-ELE-0104', 'Batería de respaldo UPS 12V 7Ah', 'Ideal para cámaras y alarmas', 3, 'venta', 45.00, 15, 1),
('CQ-ACC-0033', 'Adaptador de corriente universal', 'Múltiples conectores intercambiables', 4, 'venta', 35.00, 20, 1),
('CQ-SRV-0001', 'Instalación de cámaras CCTV', 'Servicio a domicilio, incluye configuración', 5, 'servicio_tecnico', 80.00, 0, 0);

-- Lotes de inventario
-- NOTA: cantidad_actual inicia en 0 en todos los casos; el saldo real se construye
-- exclusivamente a través de los registros de movimiento_inventario (ver más abajo),
-- que disparan el trigger trg_movimiento_after_insert. Esto evita doble conteo y
-- mantiene el kardex como única fuente de verdad del stock.
INSERT INTO lote_inventario (id_lote, id_producto, numero_lote, fecha_ingreso, fecha_vencimiento, costo_unitario, cantidad_inicial, cantidad_actual, id_proveedor) VALUES
(1, 1, 'LT-2026-0605', '2026-07-19', NULL, 130.00, 184, 0, 1),
(2, 2, 'LT-2026-0417', '2026-07-17', NULL, 220.00, 18, 0, 3),
(3, 3, 'LT-2026-0210', '2026-06-10', NULL, 2100.00, 6, 0, 3),
(4, 4, 'LT-2025-1102', '2025-11-02', NULL, 250.00, 3, 0, 3),
(5, 5, 'LT-2026-0512', '2026-07-15', NULL, 110.00, 32, 0, 2),
(6, 6, 'LT-2025-0912', '2025-09-12', '2026-08-04', 45.00, 25, 0, 3),
(7, 6, 'LT-2026-0301', '2026-07-18', '2026-11-19', 46.50, 24, 0, 3),
(8, 7, 'LT-2025-0810', '2025-08-10', '2026-07-28', 20.00, 20, 0, 3);

-- Clientes
INSERT INTO cliente (tipo_cliente, nombres_razon_social, tipo_documento, num_documento, correo, telefono, direccion, canal_origen) VALUES
('natural', 'Carlos Medina Rojas', 'DNI', '45209871', 'carlos.medina@gmail.com', '987001122', 'Jr. Cusco 245, Huancayo', 'Tienda física'),
('empresa', 'Grupo Torreblanca S.A.C.', 'RUC', '20601234567', 'compras@torreblanca.com.pe', '964800220', 'Av. Ferrocarril 890, Huancayo', 'Referido'),
('natural', 'Lucía Fernández', 'DNI', '47890112', 'lucia.fernandez@hotmail.com', '998340112', 'Jr. Piura 112, Huancayo', 'Sitio web'),
('natural', 'José Huamán', 'DNI', '41220987', 'jhuaman@gmail.com', '953112004', 'Jr. Ancash 330, Huancayo', 'Tienda física'),
('empresa', 'Constructora Andes E.I.R.L.', 'RUC', '20458990112', 'logistica@andeseirl.com', '964552018', 'Calle Real 500, Huancayo', 'Referido');

-- Reservas
INSERT INTO reserva (codigo, id_cliente, tipo_servicio, fecha, hora, estado, id_usuario_aprueba) VALUES
('RSV-1042', 1, 'Instalación de cámaras CCTV', '2026-07-21', '09:00:00', 'pendiente', NULL),
('RSV-1041', 3, 'Mantenimiento de alarma', '2026-07-21', '11:30:00', 'confirmada', 3),
('RSV-1040', 2, 'Configuración de red Wi-Fi', '2026-07-22', '08:00:00', 'confirmada', 3),
('RSV-1039', 4, 'Reparación de laptop', '2026-07-22', '14:00:00', 'cancelada', 3),
('RSV-1038', 1, 'Revisión técnica de equipo de sonido', '2026-07-23', '10:00:00', 'pendiente', NULL);

-- Ventas
-- #00231: Cámara IP 4MP (1) + Router Wi-Fi Mesh (1) = 279.00 + IGV 18% = 329.22
-- #00187: 6 baterías UPS 12V 7Ah (venta anterior, referenciada en el kardex)
INSERT INTO venta (codigo, id_cliente, id_usuario, fecha, subtotal, igv, total, metodo_pago, estado) VALUES
('#00231', 1, 3, '2026-07-19 09:50:00', 279.00, 50.22, 329.22, 'efectivo', 'pagado'),
('#00187', 1, 3, '2026-07-09 15:40:00', 270.00, 48.60, 318.60, 'tarjeta', 'pagado');

-- Detalle de venta #00231 (coincide con el ticket del POS: cámara + router)
INSERT INTO detalle_venta (id_venta, id_producto, id_lote, cantidad, precio_unitario) VALUES
(1, 1, 1, 1, 129.00),
(1, 5, 5, 1, 150.00);

-- Detalle de venta #00187 (6 baterías UPS, referenciada en el kardex del lote LT-2025-0912)
INSERT INTO detalle_venta (id_venta, id_producto, id_lote, cantidad, precio_unitario) VALUES
(2, 6, 6, 6, 45.00);

-- =====================================================================
-- Movimientos de inventario (kardex) — construyen el saldo real de cada lote
-- =====================================================================

-- Lote 1 · Cámara IP 4MP (LT-2026-0605): 184 compradas, 1 vendida en #00231 → saldo 183
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(1, 'entrada', 'compra', 184, 'F001-2245', 4, '2026-07-19 08:00:00'),
(1, 'salida',  'venta',    1, '#00231',    3, '2026-07-19 09:50:00');

-- Lote 2 · Kit de alarma inalámbrica (LT-2026-0417): 18 compradas → saldo 18
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(2, 'entrada', 'compra', 18, 'F001-2201', 4, '2026-07-17 09:12:00');

-- Lote 3 · Laptop Lenovo IdeaPad (LT-2026-0210): 6 compradas → saldo 6
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(3, 'entrada', 'compra', 6, 'F001-2150', 4, '2026-06-10 10:00:00');

-- Lote 4 · Disco duro externo 2TB (LT-2025-1102): 3 ingresadas, 3 dadas de baja por merma → saldo 0 (agotado)
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(4, 'entrada', 'compra', 3, 'F001-1980', 4, '2025-11-02 11:05:00'),
(4, 'salida',  'merma',  3, 'AJ-0012',   4, '2026-07-17 14:30:00');

-- Lote 5 · Router Wi-Fi Mesh AC1200 (LT-2026-0512): 32 compradas, 1 vendida en #00231 → saldo 31
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(5, 'entrada', 'compra', 32, 'F001-2270', 4, '2026-07-15 13:30:00'),
(5, 'salida',  'venta',   1, '#00231',    3, '2026-07-19 09:50:00');

-- Lote 6 · Batería UPS 12V 7Ah — LT-2025-0912 (vence 2026-08-04):
-- 10 (saldo inicial) + 15 (compra) − 6 (venta #00187) − 1 (servicio técnico OS-0072) − 9 (venta #00225) = 9
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(6, 'entrada', 'ajuste',           10, 'SALDO-INICIAL', 1, '2026-07-01 09:00:00'),
(6, 'entrada', 'compra',           15, 'F001-2245',      4, '2026-07-05 11:15:00'),
(6, 'salida',  'venta',             6, '#00187',         3, '2026-07-09 15:40:00'),
(6, 'salida',  'servicio_tecnico',  1, 'OS-0072',        4, '2026-07-19 08:10:00'),
(6, 'salida',  'venta',             9, '#00225',         3, '2026-07-19 09:50:00');

-- Lote 7 · Batería UPS 12V 7Ah — LT-2026-0301 (vence 2026-11-19): 24 compradas → saldo 24
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(7, 'entrada', 'compra', 24, 'F001-2298', 4, '2026-07-18 15:45:00');

-- Lote 8 · Adaptador de corriente universal (LT-2025-0810): 20 comprados, 6 vendidos → saldo 14
INSERT INTO movimiento_inventario (id_lote, tipo, motivo, cantidad, documento_referencia, id_usuario, fecha) VALUES
(8, 'entrada', 'compra', 20, 'F001-1890', 4, '2025-08-10 09:00:00'),
(8, 'salida',  'venta',   6, '#00201',    3, '2026-06-15 12:00:00');

-- =====================================================================
-- Fin del script
-- =====================================================================

