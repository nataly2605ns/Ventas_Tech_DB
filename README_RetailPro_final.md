# RetailPro — Análisis de ventas

## Descripción del proyecto

RetailPro es un proyecto de análisis de datos enfocado en explorar el comportamiento de ventas de una tienda de tecnología. A partir de una base de datos relacional, se busca transformar los registros de ventas en información útil para evaluar el rendimiento comercial y facilitar la toma de decisiones.

El proyecto integra información de **ventas, clientes, productos y categorías**. Mediante consultas SQL se analizan la facturación, el volumen de pedidos, el ticket promedio, los productos más vendidos, los clientes recurrentes y la evolución de las ventas por período. Los resultados también sirven como base para desarrollar un dashboard en Power BI.

## Objetivos

- Diseñar y consultar una base de datos relacional de ventas.
- Analizar la facturación y la cantidad de pedidos.
- Identificar los productos con mayor demanda y los que generan más ingresos.
- Reconocer clientes recurrentes y detectar clientes o productos sin ventas.
- Comparar el rendimiento de las ventas entre períodos.
- Presentar indicadores comerciales mediante un dashboard en Power BI.

## Herramientas utilizadas

- **PostgreSQL 17:** motor de base de datos utilizado para crear las tablas, definir relaciones, insertar datos y ejecutar consultas.
- **SQL:** lenguaje utilizado para la creación, consulta y análisis de los datos, incluyendo `JOIN`, funciones de agregación, subconsultas y `UNION ALL`.
- **Power BI Desktop:** herramienta utilizada para desarrollar el dashboard y visualizar los indicadores comerciales. El archivo `.pbix` contiene el informe y el modelo de Power BI.
- **Power Query:** herramienta de preparación y transformación de datos.
- **GitHub:** plataforma utilizada para almacenar y documentar los archivos del proyecto.

## Estructura del repositorio

| Archivo | Descripción |
|---|---|
| `Ventas_Tech_DB_entregable3.sql` | Script principal. Elimina las tablas existentes, crea las tablas `categorias`, `clientes`, `productos` y `ventas`, define sus claves y relaciones, inserta los datos de ejemplo y ejecuta consultas de validación. |
| `m4_consultas_negocio.sql` | Contiene cuatro consultas de análisis comercial: resumen ejecutivo mensual, ranking de los cinco productos más vendidos, identificación de clientes recurrentes y comparación de la facturación mensual con el promedio. |
| `m5_consultas_joins.sql` | Contiene cuatro consultas: vista integrada de ventas con `INNER JOIN`, búsqueda de clientes sin ventas y productos sin ventas con `LEFT JOIN`, y consolidación de ventas por semana mediante `UNION ALL`. |
| `Santiago_Nataly_Checkpoint2.pbix` | Archivo de Power BI Desktop que contiene el dashboard del proyecto RetailPro. Permite abrir y explorar el informe y sus visualizaciones. |
| `Santiago_Nataly_Checkpoint2.pdf` | Documento correspondiente a la entrega del checkpoint 2 del proyecto, con el desarrollo del modelo y la propuesta del dashboard. |

## Modelo de datos

La base de datos está compuesta por cuatro tablas principales:

- **`categorias`:** almacena las categorías de productos.
- **`clientes`:** contiene los datos de los clientes, como nombre, email, ciudad y fecha de registro.
- **`productos`:** registra los productos, su categoría, precio, stock y estado.
- **`ventas`:** contiene las operaciones de venta, incluyendo cliente, producto, cantidad, precio unitario y fecha.

Las tablas se relacionan mediante claves primarias y claves foráneas. Cada venta se vincula con un cliente y un producto, y cada producto puede estar asociado a una categoría.

## Cómo ejecutar los scripts SQL

### Requisitos

- Tener instalado **PostgreSQL 17**.
- Contar con una herramienta para conectarse a PostgreSQL, como **pgAdmin** o **psql**.

> **Importante:** los scripts están escritos para PostgreSQL. No deben ejecutarse directamente en SQL Server Management Studio (SSMS), ya que utilizan sintaxis propia de PostgreSQL.

### 1. Crear una base de datos

Desde pgAdmin o `psql`, crear una base de datos para el proyecto. Por ejemplo:

```sql
CREATE DATABASE retailpro;
```

Luego, conectarse a la base de datos `retailpro`.

### 2. Crear las tablas y cargar los datos

Abrir `Ventas_Tech_DB_entregable3.sql` en el Query Tool de pgAdmin o ejecutar el archivo desde `psql`.

Este script realiza las siguientes operaciones:

1. Elimina las tablas existentes, si las hubiera.
2. Crea las cuatro tablas del modelo.
3. Define las claves primarias, claves foráneas y restricciones.
4. Inserta los datos de ejemplo.
5. Ejecuta consultas `SELECT` para validar la cantidad de registros cargados.

> **Atención:** el script contiene instrucciones `DROP TABLE IF EXISTS`. Si se ejecuta nuevamente, eliminará las tablas existentes y sus datos antes de crearlas. Utilizarlo en una base de datos de práctica y no en una base con información que se necesite conservar.

### 3. Ejecutar las consultas de análisis

Una vez creada y poblada la base de datos, ejecutar los siguientes archivos:

- **`m4_consultas_negocio.sql`:** permite analizar la facturación mensual, los productos más vendidos, los clientes recurrentes y el rendimiento mensual en relación con el promedio.
- **`m5_consultas_joins.sql`:** permite integrar información de las tablas, identificar clientes y productos sin ventas y comparar los importes vendidos durante dos semanas mediante `UNION ALL`.

Los archivos pueden abrirse desde el Query Tool de pgAdmin y ejecutarse por consulta o en conjunto.

## Dashboard y análisis comercial

El dashboard de RetailPro fue desarrollado en Power BI para facilitar el seguimiento del rendimiento de las ventas. Incluye:

- Cuatro indicadores principales (KPIs) relacionados con las ventas.
- Un gráfico de líneas para visualizar la evolución mensual de la facturación.
- Un gráfico de barras para comparar las ventas por región.
- Filtros por año, región, ciudad y categoría.

Para visualizar el dashboard, descargar y abrir `Santiago_Nataly_Checkpoint2.pbix` con Power BI Desktop.

Las consultas SQL complementan el dashboard al aportar información sobre productos, clientes, períodos de venta y facturación.

## Alcance de los datos

El conjunto de datos de práctica contiene:

- **4 categorías**
- **5 clientes**
- **6 productos**
- **10 ventas**

Las ventas están registradas entre el **5 y el 15 de marzo de 2024**. Por tratarse de un conjunto de datos reducido y de ejemplo, los resultados permiten practicar consultas y análisis, pero no representan necesariamente el comportamiento de un negocio real.

## Autora

**Nataly Santiago**  
Proyecto de práctica de análisis de datos — RetailPro.
