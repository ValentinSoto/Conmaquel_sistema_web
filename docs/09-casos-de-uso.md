# Casos de Uso UML

## Descripción

Los casos de uso representan las funcionalidades principales del Sistema Web de Gestión Integral para Conmaquel desde la perspectiva de los usuarios. Permiten identificar la interacción entre los actores y el sistema, facilitando el análisis de los requisitos funcionales y el diseño de la aplicación.

---

# Objetivo

Modelar las principales funcionalidades del sistema y las interacciones de los actores mediante un Diagrama de Casos de Uso UML.

---

# Actores del Sistema

## Administrador

Es el usuario responsable de administrar toda la información del sistema.

### Funciones

- Iniciar sesión.
- Gestionar usuarios.
- Gestionar productos.
- Administrar inventario.
- Aprobar reservas.
- Registrar ventas.
- Generar reportes.

---

## Cliente

Es el usuario que realiza consultas y reservas de productos.

### Funciones

- Iniciar sesión.
- Consultar catálogo.
- Realizar reservas.
- Consultar estado de sus reservas.

---

# Casos de Uso Principales

| Código | Caso de Uso | Actor |
|----------|-------------|--------|
| CU-01 | Iniciar sesión | Administrador / Cliente |
| CU-02 | Gestionar usuarios | Administrador |
| CU-03 | Gestionar productos | Administrador |
| CU-04 | Consultar catálogo | Cliente |
| CU-05 | Registrar reserva | Cliente |
| CU-06 | Gestionar reservas | Administrador |
| CU-07 | Registrar venta | Administrador |
| CU-08 | Generar reportes | Administrador |

---

# Descripción de Casos de Uso

## CU-01 – Iniciar Sesión

**Actor:** Administrador / Cliente

**Descripción:**
Permite al usuario autenticarse mediante su nombre de usuario y contraseña para acceder al sistema.

---

## CU-02 – Gestionar Usuarios

**Actor:** Administrador

**Descripción:**
Permite registrar, modificar, eliminar y consultar usuarios del sistema.

---

## CU-03 – Gestionar Productos

**Actor:** Administrador

**Descripción:**
Permite registrar nuevos productos, actualizar su información y controlar el inventario.

---

## CU-04 – Consultar Catálogo

**Actor:** Cliente

**Descripción:**
Permite visualizar los productos disponibles para realizar una reserva.

---

## CU-05 – Registrar Reserva

**Actor:** Cliente

**Descripción:**
Permite registrar una solicitud de reserva de productos.

---

## CU-06 – Gestionar Reservas

**Actor:** Administrador

**Descripción:**
Permite aprobar, modificar o cancelar reservas realizadas por los clientes.

---

## CU-07 – Registrar Venta

**Actor:** Administrador

**Descripción:**
Permite registrar las ventas realizadas y actualizar automáticamente el inventario.

---

## CU-08 – Generar Reportes

**Actor:** Administrador

**Descripción:**
Permite generar reportes de ventas, reservas e inventario para apoyar la toma de decisiones.

---

# Diagrama de Casos de Uso

A continuación se presenta el Diagrama de Casos de Uso UML del Sistema Web de Gestión Integral para Conmaquel.

![Diagrama de Casos de Uso](../assets/uml/casos-de-uso.png)

**Figura 9.** Diagrama de Casos de Uso UML del sistema.

---

# Beneficios

- Identifica las funcionalidades principales.
- Facilita el análisis de requerimientos.
- Define claramente la interacción entre usuarios y sistema.
- Sirve como base para el diseño e implementación del software.

---

# Conclusión

El Diagrama de Casos de Uso permite representar de forma clara las funcionalidades del Sistema Web de Gestión Integral para Conmaquel, mostrando la interacción entre los actores y el sistema. Este modelo facilita el desarrollo del software y asegura que los requerimientos del cliente sean correctamente implementados.
