# 15. Métricas Scrum

## 15.1 Sistema de métricas de seguimiento

Dado que el proyecto se gestiona bajo Scrum, el seguimiento se realiza principalmente con métricas ágiles (velocity y burndown), complementadas con un indicador de cumplimiento de sprint y de calidad del código. Cada métrica cuenta con un umbral de alerta y un responsable de monitorearla.

| Métrica | Descripción | Umbral de alerta | Responsable | Frecuencia |
|---|---|---|---|---|
| **Velocity** | Story points completados por sprint | Desviación mayor al 20% respecto al promedio de los últimos 2 sprints | Scrum Master | Por sprint |
| **Burndown de Sprint** | Trabajo pendiente vs. tiempo restante del sprint | Línea real por encima de la línea ideal durante más de 2 días consecutivos | Scrum Master | Diaria |
| **Cumplimiento de Sprint** | % de historias de usuario completadas vs. planificadas | Cumplimiento menor al 80% | Product Owner | Por sprint |
| **Densidad de defectos** | N.º de defectos críticos detectados por sprint | Más de 5 defectos críticos por sprint | Equipo técnico / QA | Por sprint |
| **Satisfacción del cliente** | Nivel de conformidad del cliente en el Sprint Review (escala 1–5) | Calificación menor a 3 | Product Owner | Por sprint |

*Figura 10. Burndown Chart de Scrum.*

> Como referencia complementaria, en caso el proyecto requiera reportar avance a nivel gerencial en términos de costo, puede emplearse el **Valor Ganado (EVM)** mediante los indicadores PV (valor planificado), EV (valor ganado), AC (costo real) y el índice SPI (EV/PV). Sin embargo, para un proyecto ágil de este tamaño se prioriza el uso de las métricas Scrum descritas, por ser más representativas del avance real del producto.

## 15.2 Plan de gestión de riesgos

| Riesgo | Prob. | Impacto | Mitigación | Indicador de alerta |
|---|---|---|---|---|
| Cambios frecuentes de requerimientos por parte del cliente | Media | Alto | Sprint Reviews frecuentes y Product Backlog priorizado y visible al cliente | Más del 20% del backlog se modifica dentro de un mismo sprint |
| Indisponibilidad del personal de Conmaquel para validaciones | Media | Medio | Agendar reuniones fijas semanales con el cliente | Retrasos mayores a 2 días en la validación de un entregable |
| Retraso en la construcción de la base de datos (Sprint 0) | Baja | Alto | Revisión técnica anticipada del modelo entidad-relación | Sprint 0 excede los 9 días planificados |
| Falta de experiencia del equipo con las tecnologías elegidas | Media | Medio | Capacitación previa y programación en pareja (pair programming) | Velocity del sprint por debajo del 70% de lo estimado |
| Vulnerabilidades en el manejo de datos de clientes y ventas | Baja | Alto | Pruebas de seguridad y control de accesos diferenciado por rol | Hallazgos críticos en las pruebas de seguridad |
| Problemas de compatibilidad del sitio web en distintos dispositivos | Media | Bajo | Pruebas de diseño responsivo al cierre de cada sprint | Más de 2 incidencias de visualización reportadas por sprint |

## 15.3 Plan de calidad (ISO/IEC 25010 y SQA)

### 15.3.1 Perfil de calidad del producto según ISO/IEC 25010

| Característica | Nivel objetivo | Justificación | Métrica |
|---|---|---|---|
| Adecuación funcional | Alto | El sistema debe cubrir por completo la venta, reservas, inventario y servicios técnicos. | % de requerimientos funcionales implementados (meta ≥ 95%) |
| Eficiencia de desempeño | Medio | El volumen de tráfico web esperado es moderado, propio de una PYME local. | Tiempo de respuesta de las páginas menor a 3 segundos |
| Compatibilidad | Medio | Se prevé una futura integración con facturación electrónica SUNAT. | N.º de conflictos de integración detectados en pruebas = 0 |
| Usabilidad | Alto | El personal de Conmaquel tiene experiencia digital limitada. | Tasa de éxito de tareas en pruebas de usabilidad ≥ 90% |
| Confiabilidad | Alto | El sistema debe estar disponible durante todo el horario laboral. | Disponibilidad mensual del sistema ≥ 98% |
| Seguridad | Alto | El sistema maneja datos de clientes, ventas e inventario. | 0 vulnerabilidades críticas en pruebas básicas de seguridad |
| Mantenibilidad | Medio | El equipo que dará mantenimiento futuro es reducido. | Complejidad ciclomática promedio ≤ 10 por función |
| Portabilidad | Bajo | El sistema se desplegará en un único entorno de hosting definido. | Instalación exitosa en el entorno de pruebas en ≤ 1 intento |

### 15.3.2 Plan de aseguramiento de la calidad (SQA)

El plan de SQA aplica el principio de **Shift Left**: adelantar las actividades de verificación y validación a las etapas más tempranas posibles del proyecto, para detectar defectos antes de que se propaguen a fases posteriores y encarezcan su corrección.

| Actividad | Fase | Enfoque Shift Left | Responsable |
|---|---|---|---|
| Revisión de historias de usuario y criterios de aceptación | Sprint 0 / inicio de cada sprint | Alto: se revisa antes de iniciar la codificación | Product Owner y equipo técnico |
| Revisión del modelo de datos y arquitectura | Sprint 0 | Alto: se valida antes de generar el script de base de datos | Equipo técnico |
| Pruebas unitarias (enfoque TDD) | Todos los sprints | Alto: la prueba se escribe antes que el código | Desarrolladores |
| Pruebas de integración entre módulos | Cierre de cada sprint | Medio: se ejecutan apenas se integra cada módulo | Equipo técnico |
| Pruebas de aceptación con el cliente | Sprint Review de cada sprint | Medio: se valida al cierre de cada incremento, no al final del proyecto | Product Owner y cliente |
| Auditoría de seguridad y usabilidad | Antes del despliegue final (Sprint 4) | Recomendado adelantar módulos críticos (ventas, accesos) a sprints previos | Equipo técnico / QA |

### 15.3.3 Costo de calidad: regla 1-10-100

La regla 1-10-100 establece que el costo de corregir un defecto se multiplica por diez a medida que avanza de una etapa a la siguiente del ciclo de desarrollo.

| Etapa de detección | Costo relativo | Ejemplo aplicado al proyecto |
|---|---|---|
| Requerimientos / diseño | 1 | Detectar en la revisión de historias de usuario que la lógica FIFO de inventario está mal definida, antes de modelar la base de datos. |
| Construcción / pruebas | 10 | Detectar el mismo error durante las pruebas de integración del módulo de inventario, requiriendo modificar código y casos de prueba ya elaborados. |
| Producción | 100 | Detectar el error luego de la puesta en marcha, generando registros de stock incorrectos, pérdida de confianza del cliente y correcciones sobre datos reales de ventas. |

Esta relación refuerza la importancia de las actividades de Shift Left definidas en el plan de SQA: cuanto antes se detecte un defecto en el ciclo de vida del proyecto, menor será el costo económico y de reputación para Conmaquel.
