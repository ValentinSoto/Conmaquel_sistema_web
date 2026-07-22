# 4. Levantamiento de requerimientos

## 4.1 Técnica utilizada

Para el levantamiento de requerimientos se realizaron **entrevistas y cuestionarios** al personal de Conmaquel, lo que permitió analizar su flujo de trabajo y establecer los procesos que el sistema debe cubrir.

## 4.2 Requerimientos funcionales (RF)

| Código | Requerimiento |
|---|---|
| RF-01 | El sistema permitirá el inicio de sesión mediante usuario y contraseña. |
| RF-02 | El administrador podrá registrar, modificar, eliminar y consultar usuarios. |
| RF-03 | El sistema permitirá registrar, actualizar y eliminar productos. |
| RF-04 | El sistema permitirá consultar el inventario en tiempo real. |
| RF-05 | El cliente podrá visualizar el catálogo de productos disponibles. |
| RF-06 | El cliente podrá realizar reservas o pedidos de productos. |
| RF-07 | El sistema generará comprobantes de reserva. |
| RF-08 | El administrador podrá aprobar, modificar o cancelar reservas. |
| RF-09 | El sistema enviará notificaciones del estado de la reserva. |
| RF-10 | El sistema generará reportes de ventas, reservas e inventario. |
| RF-11 | El sistema registrará todas las operaciones realizadas por los usuarios. |
| RF-12 | El sistema permitirá realizar búsquedas por nombre, categoría o código del producto. |

## 4.3 Requerimientos no funcionales (RNF)

| Código | Requerimiento |
|---|---|
| RNF-01 | La interfaz debe ser intuitiva y fácil de usar. |
| RNF-02 | El tiempo de respuesta no debe superar los 3 segundos. |
| RNF-03 | El sistema deberá estar disponible el 99 % del tiempo. |
| RNF-04 | Toda la información deberá transmitirse mediante HTTPS. |
| RNF-05 | Las contraseñas deberán almacenarse cifradas. |
| RNF-06 | El sistema será compatible con Chrome, Edge y Firefox. |
| RNF-07 | El sistema será adaptable a computadoras, tablets y celulares (Responsive). |
| RNF-08 | Se realizarán copias de seguridad automáticas de la base de datos. |
| RNF-09 | El sistema permitirá crecer sin afectar el rendimiento. |
| RNF-10 | El sistema cumplirá principios de usabilidad y mantenibilidad. |

## 4.4 Procesos principales identificados en Conmaquel

| Proceso principal | Descripción |
|---|---|
| Gestión Web y Atención | Mostrar información de la empresa, catálogo de productos y servicios, recibir consultas y reservas de citas, enviar confirmaciones automáticas. |
| Gestión de Ventas y Servicios | Registrar ventas de equipos, asignar servicios técnicos, generar comprobantes y dar seguimiento a los trabajos realizados. |
| Gestión de Inventario | Controlar entradas y salidas de productos, registrar lotes, fechas de vencimiento y aplicar el método FIFO para reducir pérdidas. |
| Gestión de Usuarios y Accesos | Definir perfiles de usuario con permisos diferenciados según el rol dentro de la empresa. |

*Figura 3. Flujo del proceso de reservas o ventas.*

## 4.5 Tipos de usuario del sistema

| Tipo de usuario | Descripción |
|---|---|
| **Administrador** | Gerencia o dueño: control total del sistema, configuración, reportes y gestión de usuarios. |
| **Ventas / Atención** | Personal de mostrador: registra ventas, agenda citas y atiende consultas. |
| **Técnico** | Personal de servicio: registra avance de trabajos y materiales utilizados. |
| **Bodega** | Encargado de almacén: controla entradas, salidas, stock y fechas de vencimiento. |
| **Cliente** | Usuario externo: consulta información, realiza reservas y verifica estado de sus servicios. |

Estos cinco tipos de usuario son la base de los actores utilizados en el diagrama de casos de uso (ver **09-casos-de-uso.md**) y de la matriz de permisos por rol implementada en el módulo de Configuración → Roles y Permisos.
