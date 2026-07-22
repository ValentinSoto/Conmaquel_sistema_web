# 12. Diagrama de Despliegue (UML)

*Figura 8. Diagrama de Despliegue UML del sistema Conmaquel.*

## 12.1 Nodos del despliegue

```
┌─────────────────────────────┐
│   Dispositivo del cliente    │
│  (PC, tablet o smartphone)   │
│  ─────────────────────────   │
│  Navegador web (Chrome,      │
│  Edge, Firefox) — RNF-06     │
└───────────────┬───────────────┘
                │ HTTPS (RNF-04)
                ▼
┌─────────────────────────────┐
│      Servidor web            │
│  ─────────────────────────   │
│  Apache / PHP 8 (motor de    │
│  ejecución del backend)      │
│  Archivos estáticos:         │
│  HTML, CSS, JS, assets/      │
└───────────────┬───────────────┘
                │ Conexión segura
                │ (usuario/contraseña
                │  con privilegios acotados)
                ▼
┌─────────────────────────────┐
│    Servidor de base de datos │
│  ─────────────────────────   │
│  MySQL (motor de datos)      │
│  phpMyAdmin (administración) │
│  Copias de seguridad         │
│  automáticas — RNF-08        │
└─────────────────────────────┘
```

## 12.2 Descripción de los nodos

| Nodo | Descripción | Requerimientos relacionados |
|---|---|---|
| **Dispositivo del cliente** | Cualquier equipo con navegador moderno usado por clientes o personal de Conmaquel para acceder al sitio público o al panel administrativo. | RNF-06, RNF-07 |
| **Servidor web** | Aloja el sitio público y el panel administrativo. Ejecuta la lógica PHP y sirve los archivos estáticos (HTML, CSS, JS, imágenes). | RNF-02, RNF-03 |
| **Servidor de base de datos** | Aloja el motor MySQL con toda la información transaccional (usuarios, productos, inventario, ventas, reservas, clientes). | RNF-05, RNF-08, RNF-09 |

## 12.3 Ambientes considerados

| Ambiente | Propósito |
|---|---|
| **Desarrollo local** | Entorno de trabajo del equipo técnico durante el Sprint 0 y los sprints 1 a 3 (servidor local tipo XAMPP/Laragon + phpMyAdmin). |
| **Pruebas / staging** | Ambiente utilizado para las pruebas de aceptación con el cliente al cierre de cada sprint (ver **14-pruebas.md**). |
| **Producción** | Ambiente de hosting final, desplegado en el Sprint 4, donde Conmaquel opera el sistema con datos reales. |

## 12.4 Consideraciones de seguridad en el despliegue

- Comunicación cifrada mediante HTTPS entre el cliente y el servidor web (RNF-04).
- Contraseñas de usuario almacenadas con hash (nunca en texto plano) (RNF-05).
- Acceso a la base de datos restringido a la capa de backend, sin exposición directa a internet.
- Copias de seguridad automáticas y periódicas de la base de datos (RNF-08), permitiendo restaurar el sistema ante fallos.
