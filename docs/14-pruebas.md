# 14. Pruebas

## 14.1 Enfoque TDD para la construcción del código

Se aplica el enfoque **TDD (Desarrollo Dirigido por Pruebas)** para garantizar calidad desde la construcción del código:

1. **Escribir pruebas**: antes de codificar, se definen los casos que debe cumplir la función.
2. **Verificar fallo**: ejecutar la prueba para confirmar que aún no funciona (fase "red").
3. **Codificar**: escribir el código mínimo necesario para que la prueba pase (fase "green").
4. **Refactorizar**: mejorar la estructura sin cambiar el resultado.
5. **Repetir**: seguir el ciclo para cada nueva funcionalidad.

## 14.2 Niveles de prueba

| Nivel | Descripción |
|---|---|
| **Pruebas unitarias** | Verifican cada función por separado (por ejemplo, el cálculo del lote FIFO a descontar). |
| **Pruebas de integración** | Comprueban que los módulos se comuniquen bien entre sí (por ejemplo, que una venta descuente correctamente el inventario). |
| **Pruebas de sistema** | Evalúan el comportamiento del software completo, de extremo a extremo. |
| **Pruebas de aceptación** | Validan con el cliente (Conmaquel) que el sistema cumple con todos los requisitos solicitados, al cierre de cada Sprint Review. |
| **Pruebas de seguridad** | Aseguran que los datos estén protegidos y que solo personas autorizadas puedan acceder (RNF-04, RNF-05). |

## 14.3 Casos de prueba propuestos por módulo

### Módulo Inventario (lógica FIFO)
| ID | Caso de prueba | Resultado esperado |
|---|---|---|
| PT-01 | Registrar una venta cuando el producto tiene dos lotes con distinta fecha de vencimiento | El sistema descuenta primero del lote con vencimiento más próximo |
| PT-02 | Registrar una venta que supera la cantidad disponible en el lote más antiguo | El sistema continúa descontando del siguiente lote disponible |
| PT-03 | Registrar una venta sin stock disponible en ningún lote | El sistema rechaza la operación y muestra un mensaje de error |
| PT-04 | Un lote llega a 30 días de su fecha de vencimiento | El sistema genera una alerta visible en `inventario-stock.html` |

### Módulo Reservas
| ID | Caso de prueba | Resultado esperado |
|---|---|---|
| PT-05 | Cliente reserva un horario ya ocupado | El sistema muestra un mensaje y solicita elegir otro horario |
| PT-06 | Administrador aprueba una reserva pendiente | El estado cambia a "Confirmada" y se notifica al cliente |
| PT-07 | Administrador cancela una reserva | El estado cambia a "Cancelada" y el horario queda disponible nuevamente |

### Módulo Usuarios y accesos
| ID | Caso de prueba | Resultado esperado |
|---|---|---|
| PT-08 | Usuario intenta iniciar sesión con credenciales incorrectas | El sistema rechaza el acceso y muestra un mensaje genérico (sin revelar si el usuario existe) |
| PT-09 | Usuario con rol "Ventas" intenta acceder al módulo de Configuración | El sistema deniega el acceso según la matriz de permisos |

### Módulo Ventas
| ID | Caso de prueba | Resultado esperado |
|---|---|---|
| PT-10 | Se confirma una venta con productos válidos | El sistema calcula correctamente subtotal, IGV (18%) y total |
| PT-11 | Se anula una venta ya registrada | El sistema revierte el stock descontado y actualiza el estado a "Anulado" |

## 14.4 Pruebas de compatibilidad y responsive (RNF-06, RNF-07)

- Verificación visual y funcional en Chrome, Edge y Firefox.
- Verificación de la interfaz en tres puntos de quiebre: escritorio, tablet y móvil, siguiendo el enfoque *desktop-first* definido en el diseño (ver **08-arquitectura.md**).

## 14.5 Cierre de pruebas por sprint

Las pruebas de integración se ejecutan al cierre de cada sprint, apenas se integra cada módulo, mientras que las pruebas de aceptación con el cliente se realizan en el Sprint Review correspondiente (no se dejan para el final del proyecto). Esto se relaciona directamente con el análisis de costo de calidad (regla 1-10-100) descrito en **15-metricas-scrum.md**.
