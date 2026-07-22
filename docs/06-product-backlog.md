# 6. Product Backlog

## 6.1 Criterios de priorización

El Product Backlog se organiza por bloques funcionales, priorizados según su valor de negocio para Conmaquel y estimados por complejidad relativa (escala 1 a 5) y duración en días.

## 6.2 Product Backlog priorizado

| Descripción de la tarea / módulo | Prioridad | Complejidad | N.º Sprint | Duración (días) |
|---|---|---|---|---|
| Construcción de la arquitectura y base de datos | Alta | 4 | 0 | 9 |
| Desarrollo del sitio web público y reservas | Alta | 4 | 1 | 12 |
| Desarrollo del módulo de ventas y servicios | Alta | 5 | 2 | 15 |
| Desarrollo del módulo de gestión de inventario | Alta | 5 | 3 | 10 |
| Gestión de informes, seguridad e implementación | Media | 5 | 4 | 8 |
| **Total** | | | | **54** |

## 6.3 Detalle por módulo (Product Backlog Items)

### Sprint 0 — Arquitectura y base de datos
- Diseñar el modelo entidad-relación.
- Definir tablas y relaciones.
- Generar el script SQL inicial.
- Configurar el entorno de desarrollo.

### Sprint 1 — Sitio web público y reservas
- Landing page, Nosotros, Servicios, Catálogo, Contacto.
- Login y recuperación de contraseña.
- Módulo de Reservas (lista, nueva reserva, detalle, aprobar, cancelar).

### Sprint 2 — Ventas y servicios
- Módulo de Ventas (POS, nueva venta, historial, detalle).
- Registro y seguimiento de servicios técnicos.
- Módulo de Clientes (lista, registrar, editar, perfil).

### Sprint 3 — Gestión de inventario
- Inventario: stock, entradas, salidas, kardex.
- Control de lotes y fechas de vencimiento (FIFO).
- Alertas automáticas de stock bajo y próximos vencimientos.

### Sprint 4 — Informes, seguridad e implementación
- Módulo de Reportes (ventas, inventario, reservas, clientes) con exportación a PDF y Excel.
- Módulo de Configuración (perfil, contraseña, empresa, sistema, roles, permisos).
- Pruebas de seguridad, control de accesos por rol y despliegue final.

## 6.4 Relación con el cronograma

El detalle de fechas, hitos y entregables de cada sprint se desarrolla en **07-sprint-planning.md**, y su seguimiento (velocity, burndown, cumplimiento) en **15-metricas-scrum.md**.
