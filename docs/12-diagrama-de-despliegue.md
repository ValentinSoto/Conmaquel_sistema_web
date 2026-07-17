# Diagrama de Despliegue UML

## Descripción

El Diagrama de Despliegue UML representa la infraestructura física donde se ejecutará el Sistema Web de Gestión Integral para Conmaquel. Este diagrama muestra los dispositivos, servidores y componentes involucrados durante la ejecución de la aplicación, así como la comunicación entre ellos.

Su propósito es definir cómo se distribuirán los diferentes componentes del sistema para garantizar un funcionamiento eficiente, seguro y escalable.

---

# Objetivo

Representar la arquitectura física del sistema, mostrando los nodos, componentes y conexiones que intervienen en el funcionamiento del Sistema Web de Gestión Integral para Conmaquel.

---

# Componentes del Despliegue

## Cliente

Corresponde al dispositivo utilizado por los usuarios para acceder al sistema mediante un navegador web.

**Características**

- Computadora de escritorio.
- Laptop.
- Tablet.
- Smartphone.

Funciones:

- Acceder al sistema.
- Consultar productos.
- Registrar reservas.
- Gestionar ventas.

---

## Servidor Web

Es el encargado de recibir las solicitudes enviadas por los clientes.

Funciones principales:

- Procesar peticiones HTTP.
- Gestionar sesiones.
- Ejecutar la lógica del sistema.
- Enviar respuestas al usuario.

---

## Servidor de Aplicaciones

Contiene la lógica de negocio del sistema.

Responsabilidades:

- Validación de usuarios.
- Gestión de productos.
- Gestión de reservas.
- Registro de ventas.
- Generación de reportes.

---

## Servidor de Base de Datos

Almacena toda la información del sistema.

Información almacenada:

- Usuarios.
- Productos.
- Categorías.
- Inventario.
- Reservas.
- Ventas.
- Reportes.

---

# Comunicación entre Componentes

La comunicación del sistema sigue el siguiente flujo:

1. El usuario accede desde un navegador web.
2. El cliente envía la solicitud mediante HTTP o HTTPS.
3. El servidor procesa la solicitud.
4. Se consulta la base de datos.
5. El servidor devuelve la respuesta al cliente.

---

# Tecnologías Implementadas

| Componente | Tecnología |
|------------|------------|
| Cliente | Navegador Web |
| Frontend | HTML5, CSS3, JavaScript, Bootstrap |
| Backend | PHP |
| Base de Datos | MySQL |
| Control de Versiones | Git y GitHub |

---

# Diagrama de Despliegue

A continuación se presenta el Diagrama de Despliegue UML del Sistema Web de Gestión Integral para Conmaquel.

![Diagrama de Despliegue](../assets/uml/diagrama-de-despliegue.png)

**Figura 12.** Diagrama de Despliegue UML del Sistema Web de Gestión Integral para Conmaquel.

---

# Ventajas del Diseño

- Facilita la implementación del sistema.
- Define claramente la infraestructura necesaria.
- Permite identificar los componentes físicos.
- Mejora la escalabilidad del sistema.
- Incrementa la disponibilidad de los servicios.
- Facilita el mantenimiento y futuras actualizaciones.

---

# Consideraciones de Seguridad

Para garantizar un funcionamiento seguro del sistema se consideran las siguientes medidas:

- Autenticación mediante usuario y contraseña.
- Uso de conexiones HTTPS.
- Control de acceso por roles.
- Respaldo periódico de la base de datos.
- Validación de datos de entrada.
- Protección contra accesos no autorizados.

---

# Conclusión

El Diagrama de Despliegue UML permite visualizar la infraestructura física necesaria para el funcionamiento del Sistema Web de Gestión Integral para Conmaquel. La distribución de los componentes garantiza una comunicación eficiente entre el cliente, el servidor y la base de datos, asegurando un sistema escalable, seguro y de fácil mantenimiento.
