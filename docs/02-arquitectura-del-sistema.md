# 2. Arquitectura del sistema

## 2.1 Visión general

Conmaquel System es un **sistema web modular** que integra un sitio informativo con catálogo de productos, un módulo de reservas de citas, un módulo de ventas y servicios técnicos, y un módulo de gestión de inventario con control de vencimientos. No se trata de un sistema crítico para la vida humana ni de alta complejidad algorítmica, pero sí requiere consistencia de datos (stock, ventas) y una interfaz sencilla de usar.

Su naturaleza modular permite una construcción incremental por bloques funcionales, lo que favorece modelos de desarrollo iterativos como Scrum (ver **03-metodologia-scrum.md**).

## 2.2 Arquitectura general (vista de módulos)

El sistema se organiza en cuatro grandes procesos que se comunican entre sí a través de una base de datos central:

| Proceso principal | Descripción |
|---|---|
| **Gestión Web y Atención** | Muestra información de la empresa, catálogo de productos y servicios, recibe consultas y reservas de citas, envía confirmaciones automáticas. |
| **Gestión de Ventas y Servicios** | Registra ventas de equipos, asigna servicios técnicos, genera comprobantes y da seguimiento a los trabajos realizados. |
| **Gestión de Inventario** | Controla entradas y salidas de productos, registra lotes, fechas de vencimiento y aplica el método FIFO para reducir pérdidas. |
| **Gestión de Usuarios y Accesos** | Define perfiles de usuario con permisos diferenciados según el rol dentro de la empresa. |

*Figura 2. Arquitectura del sistema (diagrama de bloques): capa de presentación (sitio público y panel administrativo) → capa de lógica de negocio (controladores PHP por módulo) → capa de datos (MySQL).*

## 2.3 Patrón arquitectónico

El sistema se construye siguiendo un patrón de **arquitectura cliente-servidor en 3 capas**:

1. **Capa de presentación (Frontend)**: HTML5, CSS3, Bootstrap 5, JavaScript, Font Awesome y Chart.js. Incluye el sitio público y el panel administrativo, ambos con una identidad visual consistente (sidebar, navbar, breadcrumbs, tarjetas KPI, tablas con filtros y paginación).
2. **Capa de lógica de negocio (Backend)**: PHP 8, organizado por controladores según módulo (usuarios, productos, categorías, inventario, reservas, ventas, clientes, reportes, configuración).
3. **Capa de datos (Base de datos)**: MySQL, administrada mediante phpMyAdmin, con el modelo entidad-relación descrito en **10-modelo-er.md**.

Para el detalle técnico por capa (tecnologías específicas, estructura de carpetas del repositorio y diagrama de despliegue), ver **08-arquitectura.md** y **12-diagrama-de-despliegue.md**.

## 2.4 Principios de diseño aplicados

- **Consistencia visual**: todas las pantallas del panel administrativo comparten los mismos componentes (sidebar, navbar, breadcrumb, avatar, notificaciones, buscador y footer).
- **Responsive first**: diseño primero para escritorio, luego adaptado a tablet y móvil, sin pérdida de funcionalidad (RNF-07).
- **Trazabilidad**: toda operación relevante (venta, movimiento de inventario, cambio de estado de una reserva) queda registrada con el usuario que la ejecutó (RF-11).
- **Modularidad**: cada proceso de negocio (ventas, inventario, reservas, usuarios) se implementa como un módulo independiente que puede evolucionar sin afectar a los demás, facilitando el desarrollo incremental por sprints.
