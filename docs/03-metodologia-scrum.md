# 3. Metodología Scrum

## 3.1 Diagnóstico organizacional

Para justificar objetivamente la elección de la metodología de desarrollo, se realizó un diagnóstico de Conmaquel basado en las variables propuestas por Sommerville.

### 3.1.1 Cultura organizacional

Conmaquel, con más de 35 años de trayectoria como empresa regional pionera en electrónica y seguridad en Huancayo, basa su cultura organizacional en los pilares de **"confianza, especialización y respaldo garantizado"**. Esta filosofía se vive en el día a día a través de:

- Una sólida orientación al cliente, enfocada en la asesoría profesional y personalizada.
- Constante innovación y mejora continua para adaptarse con agilidad a las nuevas tecnologías del mercado.
- Un firme compromiso con el servicio técnico y soporte, con acompañamiento y respaldo directo tanto en sitio como en línea.

No existen procesos de gestión de proyectos formalizados ni experiencia previa trabajando con equipos de desarrollo de software, aunque la dirección se muestra abierta al cambio digital.

### 3.1.2 Madurez del equipo de TI

Conmaquel no cuenta con un área de tecnologías de la información propia; las funciones operativas (ventas, atención, bodega, servicio técnico) son realizadas por personal con conocimientos informáticos básicos. El equipo de desarrollo debe asumir un rol activo no solo en la construcción del software, sino también en la validación funcional constante con el cliente.

### 3.1.3 Naturaleza del producto

El producto es un sistema web modular (ver **02-arquitectura-del-sistema.md**), de naturaleza no crítica, pero que exige consistencia de datos y una interfaz sencilla. Su construcción por bloques funcionales favorece un desarrollo iterativo e incremental.

### 3.1.4 Restricciones de negocio

- Presupuesto limitado, propio de una PYME.
- Plazo académico y comercial acotado: 54 días distribuidos en un Sprint 0 y cuatro sprints de desarrollo.
- Disponibilidad limitada del personal de Conmaquel para reuniones de validación.
- Necesidad de mostrar avances tangibles de forma temprana.

## 3.2 Evaluación comparativa de modelos de desarrollo

Se comparan tres modelos —Cascada, Incremental y Scrum— bajo cinco criterios derivados del diagnóstico organizacional.

| Criterio | Cascada | Incremental | Scrum |
|---|---|---|---|
| Flexibilidad ante cambios | Baja: requerimientos congelados al inicio | Media: ajustes entre incrementos | **Alta**: backlog reordenable cada sprint |
| Involucramiento del cliente | Bajo: al inicio y al final | Medio: al cierre de cada incremento | **Alto**: revisión al final de cada sprint |
| Tiempo de entrega de valor | Largo: al final del proyecto | Medio: incrementos parciales | **Corto**: incremento utilizable cada sprint |
| Complejidad de gestión | Baja | Media | Media (con herramientas simples) |
| Adecuación al tamaño del equipo | Grandes proyectos definidos | Proyectos medianos | **Equipos pequeños**, alcance evolutivo |

De los cinco criterios evaluados, **Scrum obtiene el mejor desempeño en cuatro de ellos** (flexibilidad, involucramiento del cliente, tiempo de entrega de valor y adecuación al tamaño del equipo). El modelo Cascada solo resulta favorable con requisitos completamente estables, condición que no se cumple en Conmaquel. El modelo Incremental es razonable, pero entrega valor con menor frecuencia y no maximiza la retroalimentación temprana.

## 3.3 Modelo elegido: Scrum

Se emplea el modelo **Scrum** para el desarrollo del software. Esta elección se fundamenta en la naturaleza de los procesos de Conmaquel, que requieren flexibilidad para adaptarse a cambios en el catálogo de productos, precios o servicios.

Scrum permite:

- Una colaboración estrecha entre el equipo de desarrollo y el cliente.
- Alineación constante con las necesidades del negocio a lo largo del proceso.
- Mayor capacidad para manejar cambios en los requerimientos de manera ágil.
- Un producto final de alta calidad, entregado de manera oportuna.

*Figura 1. Diagrama del proceso Scrum: Product Backlog → Sprint Planning → Sprint Backlog → Sprint (Daily Scrum) → Incremento → Sprint Review → Sprint Retrospective.*

## 3.4 Roles Scrum en el proyecto

| Rol Scrum | Responsable en el proyecto |
|---|---|
| Product Owner | Representante de Conmaquel / validación de requerimientos |
| Scrum Master | Equipo técnico (facilita el proceso y remueve impedimentos) |
| Equipo de desarrollo | Estudiante(s) a cargo del desarrollo del sistema |

> **Nota:** al tratarse de un equipo reducido, la separación de roles Scrum es más conceptual que real. Esta limitación y su propuesta de mejora se detallan en **16-conclusiones.md**.
