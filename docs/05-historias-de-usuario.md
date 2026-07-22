# 5. Historias de usuario

## 5.1 Formato utilizado

Las historias de usuario se definen siguiendo el formato estándar:

> **"Como** [rol], **quiero** [acción], **para** [beneficio]."

## 5.2 Historias de usuario del proyecto

| ID | Historia de usuario |
|---|---|
| **HU01** | Como cliente, quiero ver el catálogo de productos y servicios, para conocer lo que ofrece Conmaquel. |
| **HU02** | Como cliente, quiero reservar una cita de atención, para ser atendido sin esperas. |
| **HU03** | Como vendedor, quiero registrar una venta, para dejar constancia y actualizar el stock. |
| **HU04** | Como encargado de bodega, quiero ingresar mercancía, para llevar el control de lotes y vencimientos. |
| **HU05** | Como técnico, quiero registrar el avance de un servicio, para tener un historial detallado. |
| **HU06** | Como administrador, quiero ver reportes de ventas y stock, para planificar compras y estrategias. |

## 5.3 Trazabilidad con requerimientos

| Historia | Requerimientos funcionales relacionados | Pantallas del sistema relacionadas |
|---|---|---|
| HU01 | RF-05, RF-12 | `catalogo.html`, `index.html` |
| HU02 | RF-06, RF-07, RF-09 | Login → Reservas (lista, nueva, detalle) |
| HU03 | RF-03, RF-04 | `ventas-pos.html` |
| HU04 | RF-04, RF-11 | `inventario-entradas.html`, `inventario-kardex.html` |
| HU05 | RF-11 | Reservas → Servicio técnico (detalle) |
| HU06 | RF-10 | `reportes.html`, `dashboard.html` |

## 5.4 Criterios de aceptación sugeridos (mejora identificada)

Como parte de las mejoras identificadas en el proyecto (ver **16-conclusiones.md**), se recomienda documentar criterios de aceptación explícitos para cada historia. Ejemplo aplicado a HU02:

**HU02 — Como cliente, quiero reservar una cita de atención, para ser atendido sin esperas.**

- **Dado que** un cliente ha iniciado sesión, **cuando** selecciona un servicio, fecha y hora disponibles, **entonces** el sistema crea la reserva en estado "Pendiente".
- **Dado que** una reserva fue creada, **cuando** el administrador la aprueba, **entonces** el sistema notifica al cliente y cambia el estado a "Confirmada".
- **Dado que** una reserva está en estado "Pendiente" o "Confirmada", **cuando** el cliente o el administrador la cancela, **entonces** el sistema cambia el estado a "Cancelada" y libera el horario.
