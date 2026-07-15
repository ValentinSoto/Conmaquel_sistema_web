# Arquitectura del Sistema

## Descripción

La arquitectura del Sistema Web de Gestión Integral para Conmaquel se basa en una arquitectura de tres capas (Three-Tier Architecture), la cual separa la presentación, la lógica de negocio y la base de datos. Esta estructura facilita el mantenimiento, la escalabilidad y la seguridad del sistema.

La comunicación entre las diferentes capas se realiza mediante protocolos HTTP/HTTPS, permitiendo que los usuarios accedan al sistema desde cualquier navegador web con conexión a Internet.

---

# Objetivos de la Arquitectura

- Garantizar una estructura organizada y escalable.
- Facilitar el mantenimiento del sistema.
- Proteger la información almacenada.
- Mejorar el rendimiento y la disponibilidad.
- Permitir futuras ampliaciones sin afectar los módulos existentes.

---

# Componentes de la Arquitectura

## Cliente

Corresponde a los usuarios que acceden al sistema mediante un navegador web.

Funciones principales:

- Inicio de sesión.
- Consulta de productos.
- Gestión de reservas.
- Registro de ventas.
- Visualización de reportes.

---

## Servidor Web

Es el encargado de recibir las solicitudes realizadas por los clientes.

Funciones:

- Procesar solicitudes HTTP.
- Ejecutar la lógica del sistema.
- Validar la información recibida.
- Gestionar la comunicación con la base de datos.

---

## Base de Datos

Almacena toda la información del sistema.

Entre los principales datos registrados se encuentran:

- Usuarios.
- Productos.
- Categorías.
- Inventario.
- Reservas.
- Ventas.
- Reportes.

---

# Flujo de Funcionamiento

El funcionamiento general del sistema sigue el siguiente proceso:

1. El usuario accede desde el navegador web.
2. La solicitud es enviada al servidor.
3. El servidor procesa la petición.
4. Se consulta o actualiza la base de datos.
5. La información es enviada nuevamente al servidor.
6. El servidor responde al cliente mostrando el resultado solicitado.

---

# Tecnologías Utilizadas

| Componente | Tecnología |
|------------|------------|
| Frontend | HTML5, CSS3, JavaScript, Bootstrap |
| Backend | PHP |
| Base de Datos | MySQL |
| Control de Versiones | Git y GitHub |

---

# Beneficios de la Arquitectura

- Separación de responsabilidades.
- Mayor seguridad.
- Mejor rendimiento.
- Fácil mantenimiento.
- Escalabilidad.
- Reutilización del código.

---

# Figura

## Figura 2. Arquitectura del Sistema

![Arquitectura del Sistema](../assets/uml/arquitectura-del-sistema.png)

**Figura 2.** Arquitectura del Sistema (Cliente – Servidor – Base de datos).

# Conclusión

La arquitectura propuesta proporciona una base sólida para el desarrollo del Sistema Web de Gestión Integral para Conmaquel, permitiendo una comunicación eficiente entre los usuarios, el servidor y la base de datos. Además, favorece la mantenibilidad, la escalabilidad y la seguridad del software, aspectos fundamentales para garantizar el correcto funcionamiento del sistema.
