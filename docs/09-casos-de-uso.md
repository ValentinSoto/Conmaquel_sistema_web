# 9. Casos de uso

## 9.1 Actores del sistema

| Actor | Descripción |
|---|---|
| **Administrador** | Gerencia o dueño: control total del sistema, configuración, reportes y gestión de usuarios. |
| **Ventas / Atención** | Personal de mostrador: registra ventas, agenda citas y atiende consultas. |
| **Técnico** | Personal de servicio: registra avance de trabajos y materiales utilizados. |
| **Bodega** | Encargado de almacén: controla entradas, salidas, stock y fechas de vencimiento. |
| **Cliente** | Usuario externo: consulta información, realiza reservas y verifica el estado de sus servicios. |

## 9.2 Diagrama de casos de uso (descripción textual)

*Figura 4. Diagrama de Casos de Uso UML.*

```
Cliente ──┬── Ver catálogo de productos
          ├── Reservar cita de atención
          ├── Consultar estado de reserva
          └── Consultar historial de compras (perfil)

Ventas/Atención ──┬── Registrar venta (POS)
                   ├── Aprobar / cancelar reserva
                   ├── Registrar / editar cliente
                   └── Consultar catálogo e inventario

Técnico ──┬── Registrar avance de servicio técnico
          └── Consultar historial de órdenes asignadas

Bodega ──┬── Registrar entrada de inventario
         ├── Registrar salida de inventario
         ├── Consultar kardex
         └── Recibir alertas de vencimiento / stock bajo

Administrador ──┬── Gestionar usuarios (CRUD + permisos)
                ├── Gestionar productos y categorías
                ├── Aprobar / modificar / cancelar reservas
                ├── Generar reportes (ventas, inventario, reservas, clientes)
                └── Configurar empresa, roles y permisos
```

## 9.3 Especificación de casos de uso principales

### CU-01: Reservar cita de atención
- **Actor principal**: Cliente
- **Precondición**: el cliente ha iniciado sesión.
- **Flujo principal**:
  1. El cliente accede al catálogo o al módulo de reservas.
  2. Selecciona el servicio, fecha y hora disponible.
  3. Confirma la reserva.
  4. El sistema registra la reserva en estado "Pendiente" (RF-06, RF-07).
- **Postcondición**: la reserva queda visible para el administrador en `reservas-lista.html`.
- **Flujo alternativo**: si el horario ya no está disponible, el sistema muestra un mensaje y solicita elegir otro horario.

### CU-02: Registrar una venta
- **Actor principal**: Ventas / Atención
- **Precondición**: el usuario tiene sesión activa con permisos de ventas.
- **Flujo principal**:
  1. El usuario busca y agrega productos al ticket (`ventas-pos.html`).
  2. Selecciona el cliente (o "Cliente genérico").
  3. Elige el método de pago y confirma la venta.
  4. El sistema descuenta el stock correspondiente aplicando FIFO (RF-03, RF-04) y genera el comprobante.

### CU-03: Registrar entrada de inventario
- **Actor principal**: Bodega
- **Flujo principal**:
  1. El usuario selecciona el producto, cantidad, costo unitario, lote y fecha de vencimiento (si aplica).
  2. Indica el tipo de entrada (compra, devolución, ajuste, transferencia).
  3. El sistema actualiza el stock y registra el movimiento en el kardex.

### CU-04: Aprobar o cancelar una reserva
- **Actor principal**: Administrador (también Ventas/Atención)
- **Flujo principal**:
  1. El actor revisa la lista de reservas pendientes.
  2. Aprueba o cancela la reserva.
  3. El sistema notifica al cliente el nuevo estado (RF-08, RF-09).

### CU-05: Generar reportes
- **Actor principal**: Administrador
- **Flujo principal**:
  1. El administrador accede al módulo de Reportes.
  2. Filtra por fecha, sucursal y tipo de reporte (ventas, inventario, reservas, clientes).
  3. Exporta el resultado en PDF o Excel (RF-10).
