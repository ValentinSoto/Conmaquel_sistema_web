# 1. Introducción

## 1.1 Presentación del proyecto

El presente documento describe la planificación y el desarrollo del proyecto **"Desarrollo de sitio web y sistema de gestión integral para Conmaquel"**, orientado a resolver la carencia de un canal digital funcional y de un sistema que integre las áreas de atención al cliente, ventas, inventario y servicio técnico de la empresa **Centro Electrónico Conmaquel Ingenieros E.I.R.L.**

## 1.2 Información del proyecto

| Campo | Detalle |
|---|---|
| **Empresa** | Centro Electrónico Conmaquel Ingenieros E.I.R.L. / Conmaquel System |
| **Rubro** | Venta de equipos electrónicos, sistemas de seguridad, soluciones informáticas y servicio técnico |
| **Ubicación** | Jr. Loreto 627, Huancayo, Junín |
| **Antigüedad** | Más de 35 años de trayectoria en el rubro electrónico y de seguridad en Huancayo |
| **Presentado por** | Soto Barrientos, Valentin B. — Código S01299J |
| **Ingeniero a cargo** | Jaime Antonio Huaytalla Pariona |
| **Lugar y año** | Huancayo – Perú, 2026 |

## 1.3 Problemática

Conmaquel no cuenta con un sitio web funcional ni con un sistema de gestión integrado. Su página actual es estática y no permite interactuar con los clientes ni administrar las operaciones internas de forma eficiente. Las áreas de ventas, atención al cliente, bodega y servicio técnico trabajan de manera manual o parcialmente digitalizada (hojas de cálculo, cuadernos de control), lo que genera:

- Falta de visibilidad en tiempo real del stock e inventario.
- Dificultad para llevar el control de vencimientos de productos electrónicos y componentes.
- Ausencia de un canal en línea para que los clientes conozcan el catálogo o reserven una cita.
- Falta de trazabilidad de las operaciones (quién vendió, quién atendió, quién movió el inventario).

## 1.4 Objetivo general

Desarrollar un sitio web profesional y un sistema de gestión que permita:

- Mostrar el catálogo de productos y servicios actualizado.
- Recibir y gestionar reservas de citas para atención o servicio técnico.
- Administrar el inventario con control de fechas de vencimiento (método FIFO).
- Registrar ventas y dar seguimiento a los servicios técnicos.
- Generar reportes operativos para la toma de decisiones.

## 1.5 Objetivos específicos

1. Realizar el diagnóstico organizacional de Conmaquel para justificar la metodología de desarrollo a emplear.
2. Levantar y documentar los requerimientos funcionales y no funcionales del sistema.
3. Diseñar la arquitectura, el modelo de datos y los diagramas UML del sistema.
4. Planificar el desarrollo bajo el modelo ágil Scrum, con Product Backlog, Sprint 0 y sprints de desarrollo.
5. Definir un plan de calidad basado en ISO/IEC 25010 y actividades de aseguramiento de calidad (SQA).
6. Establecer un sistema de métricas de seguimiento y un plan de gestión de riesgos.

## 1.6 Alcance

El proyecto abarca la planificación completa y el desarrollo incremental de un sistema web compuesto por:

- **Módulo público**: landing page, catálogo, información de la empresa, servicios y contacto.
- **Módulo de autenticación**: inicio de sesión y recuperación de contraseña.
- **Panel administrativo**: dashboard, usuarios, productos, categorías, inventario (con lotes y vencimientos), reservas, ventas (POS), clientes, reportes y configuración.

Quedan fuera del alcance de esta primera versión la integración con facturación electrónica SUNAT y las pasarelas de pago en línea, las cuales se plantean como trabajo futuro (ver documento **16-conclusiones.md**).

## 1.7 Resumen ejecutivo

Tras un diagnóstico organizacional basado en las variables propuestas por Sommerville (cultura organizacional, madurez del equipo de TI, naturaleza del producto y restricciones de negocio) y una evaluación comparativa de tres modelos de desarrollo de software (Cascada, Incremental y Scrum), se determinó que el modelo ágil **Scrum** es el más adecuado para el contexto de la empresa, debido a su capacidad de adaptación a requerimientos cambiantes y a la necesidad de entregas de valor tempranas y frecuentes.

El proyecto desarrolla el levantamiento de requerimientos, las historias de usuario, el Product Backlog, el Sprint 0, el diseño de la base de datos y el plan de pruebas del sistema, junto con un plan de gestión de proyecto (cronograma, riesgos, métricas) y un plan de calidad. Como resultado, se obtiene una propuesta técnica y de gestión completa, viable para una empresa de tipo PYME, que sienta las bases para la construcción de Conmaquel System.
