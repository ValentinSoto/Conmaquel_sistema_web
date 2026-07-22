# 8. Arquitectura técnica

> Este documento complementa a **02-arquitectura-del-sistema.md** (vista de alto nivel) con el detalle técnico de implementación: stack tecnológico, estructura de carpetas y convenciones del proyecto.

## 8.1 Stack tecnológico

| Capa | Tecnología | Uso |
|---|---|---|
| Frontend | HTML5, CSS3, JavaScript | Estructura, estilos y comportamiento de las páginas |
| Framework CSS | Bootstrap 5 | Sistema de grillas, componentes y responsive design |
| Iconografía | Font Awesome | Íconos en sidebar, tablas, botones y tarjetas |
| Gráficos | Chart.js | Gráficos del dashboard y reportes (ventas, categorías) |
| Backend | PHP 8 | Lógica de negocio y controladores por módulo |
| Base de datos | MySQL | Almacenamiento persistente de la información |
| Administración de BD | phpMyAdmin | Gestión visual de la base de datos en desarrollo |

## 8.2 Estructura del repositorio

```
Conmaquel/
├── assets/          → Imágenes, íconos y recursos estáticos del sitio
├── database/         → Scripts SQL (estructura y datos de prueba)
├── docs/             → Documentación del proyecto (este conjunto de archivos)
├── docs_pdf/         → Versión PDF del informe de avance
├── src/              → Código fuente PHP (controladores, modelos, vistas)
├── tests/            → Pruebas unitarias, de integración y de aceptación
└── README.md
```

## 8.3 Arquitectura por capas

1. **Capa de presentación**: páginas HTML/PHP organizadas en dos frentes:
   - **Sitio público**: `index.html`, `nosotros.html`, `servicios.html`, `catalogo.html`, `contacto.html`, `login.html`, `recuperar-contrasena.html`.
   - **Panel administrativo**: `dashboard.html` y los módulos de gestión (usuarios, productos, categorías, inventario, reservas, ventas, clientes, reportes, configuración), todos compartiendo el mismo sistema de diseño (`assets/css/style.css`).

2. **Capa de lógica de negocio**: controladores PHP agrupados por módulo, responsables de la validación de datos, aplicación de reglas de negocio (por ejemplo, el descuento FIFO en inventario) y comunicación con la base de datos.

3. **Capa de datos**: base de datos MySQL con las entidades descritas en **10-modelo-er.md**, accedida mediante consultas preparadas (prepared statements) para prevenir inyección SQL, en línea con RNF-04 y RNF-05.

## 8.4 Comunicación entre capas

```
[Navegador del usuario]
        │  HTTPS (RNF-04)
        ▼
[Servidor web Apache + PHP 8]
        │  Controladores por módulo
        ▼
[Base de datos MySQL]
```

## 8.5 Convenciones del sistema de diseño (Frontend)

- **Paleta de colores**: azul oscuro (marca), blanco, verde (éxito), naranja (advertencia), rojo (error), gris muy claro (fondo).
- **Tipografía**: Inter.
- **Componentes reutilizables**: sidebar, navbar, breadcrumb, tarjetas KPI, tablas con buscador/filtro/orden/paginación/exportación, formularios con validación.
- **Responsive**: diseño mobile-first evaluado en tres puntos de quiebre (escritorio, tablet, móvil), sin pérdida de funcionalidad (RNF-07).

Estas convenciones garantizan que todas las pantallas —ya sean del sitio público o del panel administrativo— se perciban como parte de un mismo producto (Conmaquel System).
