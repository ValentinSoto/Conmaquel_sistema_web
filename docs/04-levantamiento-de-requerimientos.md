# Levantamiento de Requerimientos

## Descripción

El levantamiento de requerimientos es una etapa fundamental del desarrollo de software, ya que permite identificar las necesidades de los usuarios y definir las funcionalidades que deberá cumplir el sistema. Para el proyecto **Sistema Web de Gestión Integral para Conmaquel**, se realizó un análisis de los procesos actuales de la empresa, identificando las actividades relacionadas con la gestión de productos, inventario, reservas y ventas.

La información obtenida permitió establecer los requerimientos funcionales y no funcionales, los cuales servirán como base para el diseño, desarrollo e implementación del sistema.

---

# Requerimientos Funcionales

| Código | Requerimiento |
|---------|---------------|
| RF-01 | El sistema permitirá el inicio de sesión mediante usuario y contraseña. |
| RF-02 | El administrador podrá registrar, modificar, eliminar y consultar usuarios. |
| RF-03 | El sistema permitirá registrar, actualizar y eliminar productos. |
| RF-04 | El sistema permitirá administrar el inventario en tiempo real. |
| RF-05 | El cliente podrá visualizar el catálogo de productos disponibles. |
| RF-06 | El cliente podrá realizar reservas de productos. |
| RF-07 | El sistema generará comprobantes de reserva. |
| RF-08 | El administrador podrá aprobar, modificar o cancelar reservas. |
| RF-09 | El sistema generará reportes de ventas e inventario. |
| RF-10 | El sistema permitirá búsquedas por nombre, categoría o código del producto. |

---

# Requerimientos No Funcionales

| Código | Requerimiento |
|---------|---------------|
| RNF-01 | La interfaz debe ser intuitiva y fácil de utilizar. |
| RNF-02 | El tiempo de respuesta del sistema no deberá superar los 3 segundos. |
| RNF-03 | El sistema deberá estar disponible el 99 % del tiempo. |
| RNF-04 | La información deberá transmitirse mediante HTTPS. |
| RNF-05 | Las contraseñas deberán almacenarse de forma segura. |
| RNF-06 | El sistema será compatible con los principales navegadores web. |
| RNF-07 | La aplicación será adaptable a dispositivos móviles. |
| RNF-08 | Se realizarán copias de seguridad de la base de datos. |
| RNF-09 | El sistema deberá ser escalable y mantenible. |
| RNF-10 | El sistema cumplirá criterios de usabilidad y seguridad. |

---

# Proceso de Reservas (BPMN)

El siguiente diagrama representa el flujo del proceso de reservas de productos dentro del sistema.

![Proceso BPMN](../assets/bpmn/proceso-reservas.png)

**Figura 3.** Flujo del proceso de reservas o ventas (BPMN).

---

# Beneficios del Levantamiento de Requerimientos

- Permite comprender las necesidades del cliente.
- Reduce errores durante el desarrollo.
- Facilita la planificación de los Sprint.
- Mejora la calidad del software.
- Sirve como base para el Product Backlog y las Historias de Usuario.

---

# Conclusión

El levantamiento de requerimientos permitió identificar las funcionalidades y restricciones del Sistema Web de Gestión Integral para Conmaquel. Esta información constituye el punto de partida para el diseño de la solución y la planificación de las actividades bajo la metodología Scrum.
