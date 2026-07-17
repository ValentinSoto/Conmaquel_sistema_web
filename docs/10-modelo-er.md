# Modelo Entidad – Relación (ER)

## Descripción

El Modelo Entidad–Relación (ER) representa la estructura lógica de la base de datos del Sistema Web de Gestión Integral para Conmaquel. Su objetivo es identificar las entidades, atributos y relaciones necesarias para almacenar y gestionar la información de manera organizada, evitando redundancia y garantizando la integridad de los datos.

El diseño de la base de datos permite administrar usuarios, productos, categorías, reservas, ventas e inventario, facilitando el funcionamiento eficiente del sistema.

---

# Objetivo

Diseñar un modelo de base de datos que permita almacenar la información del sistema de forma segura, consistente y escalable.

---

# Entidades Principales

## Usuario

Almacena la información de las personas que utilizan el sistema.

**Atributos**

- id_usuario
- nombres
- apellidos
- correo
- contraseña
- rol
- estado

---

## Producto

Contiene la información de los productos registrados.

**Atributos**

- id_producto
- nombre
- descripción
- precio
- stock
- id_categoria

---

## Categoría

Permite clasificar los productos.

**Atributos**

- id_categoria
- nombre
- descripción

---

## Reserva

Registra las reservas realizadas por los clientes.

**Atributos**

- id_reserva
- fecha
- estado
- id_usuario

---

## Venta

Almacena las ventas realizadas.

**Atributos**

- id_venta
- fecha
- total
- id_usuario

---

## Detalle Venta

Contiene los productos asociados a cada venta.

**Atributos**

- id_detalle
- cantidad
- precio
- subtotal
- id_producto
- id_venta

---

# Relaciones

| Entidad | Relación | Entidad |
|----------|----------|----------|
| Categoría | 1 : N | Producto |
| Usuario | 1 : N | Reserva |
| Usuario | 1 : N | Venta |
| Venta | 1 : N | Detalle Venta |
| Producto | 1 : N | Detalle Venta |

---

# Reglas de Negocio

- Un usuario puede realizar varias reservas.
- Un usuario puede registrar múltiples ventas.
- Una categoría puede contener varios productos.
- Un producto pertenece únicamente a una categoría.
- Una venta puede contener varios productos.
- Un producto puede estar presente en múltiples ventas.

---

# Integridad de la Base de Datos

Para garantizar la consistencia de la información se implementan:

- Claves primarias (Primary Key).
- Claves foráneas (Foreign Key).
- Restricciones de integridad referencial.
- Validaciones de datos.
- Control de duplicidad.

---

# Modelo Entidad–Relación

El siguiente diagrama representa la estructura de la base de datos del sistema.

![Modelo ER](../assets/uml/modelo-er.png)

**Figura 10.** Modelo Entidad–Relación (ER) del Sistema Web de Gestión Integral para Conmaquel.

---

# Beneficios

- Reduce la redundancia de información.
- Facilita el mantenimiento de la base de datos.
- Garantiza la integridad de los datos.
- Optimiza las consultas.
- Mejora el rendimiento del sistema.

---

# Conclusión

El Modelo Entidad–Relación constituye la base para el diseño de la base de datos del Sistema Web de Gestión Integral para Conmaquel. Su correcta estructuración permite almacenar la información de manera eficiente y soportar todas las funcionalidades
