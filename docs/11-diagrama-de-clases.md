# Diagrama de Clases UML

## Descripción

El Diagrama de Clases UML representa la estructura estática del Sistema Web de Gestión Integral para Conmaquel. En él se identifican las principales clases, sus atributos, métodos y relaciones, proporcionando una visión clara de la organización interna del software.

Este diagrama sirve como base para la implementación del sistema, permitiendo establecer la interacción entre los diferentes componentes y facilitando el mantenimiento y la escalabilidad de la aplicación.

---

# Objetivo

Diseñar la estructura de clases del sistema para representar las entidades, sus responsabilidades y las relaciones existentes entre ellas.

---

# Clases Principales

## Clase Usuario

**Atributos**

- idUsuario
- nombres
- apellidos
- correo
- contraseña
- rol
- estado

**Métodos**

- iniciarSesion()
- cerrarSesion()
- actualizarPerfil()

---

## Clase Producto

**Atributos**

- idProducto
- nombre
- descripcion
- precio
- stock

**Métodos**

- registrarProducto()
- actualizarProducto()
- eliminarProducto()
- consultarProducto()

---

## Clase Categoria

**Atributos**

- idCategoria
- nombre
- descripcion

**Métodos**

- registrarCategoria()
- actualizarCategoria()

---

## Clase Reserva

**Atributos**

- idReserva
- fecha
- estado

**Métodos**

- registrarReserva()
- cancelarReserva()
- confirmarReserva()

---

## Clase Venta

**Atributos**

- idVenta
- fecha
- total

**Métodos**

- registrarVenta()
- calcularTotal()
- generarComprobante()

---

## Clase Reporte

**Atributos**

- idReporte
- tipo
- fecha

**Métodos**

- generarReporteVentas()
- generarReporteInventario()
- exportarPDF()

---

# Relaciones entre Clases

| Clase | Relación | Clase |
|--------|----------|--------|
| Usuario | Gestiona | Reserva |
| Usuario | Registra | Venta |
| Categoria | Contiene | Producto |
| Venta | Contiene | Producto |
| Reporte | Consulta | Venta |
| Reporte | Consulta | Producto |

---

# Principios Aplicados

Durante el diseño se consideraron los siguientes principios de Ingeniería de Software:

- Alta cohesión.
- Bajo acoplamiento.
- Reutilización de código.
- Modularidad.
- Escalabilidad.
- Mantenibilidad.

---

# Diagrama de Clases UML

A continuación se presenta el Diagrama de Clases UML del Sistema Web de Gestión Integral para Conmaquel.

![Di
