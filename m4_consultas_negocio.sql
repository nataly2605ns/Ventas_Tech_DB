-- Motor utilizado: PostgreSQL 17

-- Consulta 1 — Resumen ejecutivo mensual

SELECT
EXTRACT(MONTH FROM fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);

-- Consulta 2 — Ranking de productos

SELECT
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM (cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY unidades_vendidas DESC LIMIT 5

-- Consulta 3 — Clientes recurrentes

SELECT
id_cliente,
COUNT(*) AS cantidad_de_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1

-- Consulta 4 — Meses por encima/por debajo del promedio

SELECT
EXTRACT(MONTH FROM fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE
WHEN SUM(cantidad * precio_unitario) > (SELECT AVG(total_facturado)
FROM (
SELECT
EXTRACT(MONTH FROM fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
) AS promedio_mensual
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS promedio_mensual
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);

-- Bloque de cierre
-- El mes 3 tuvo un total de 10 pedidos y el ticket promedio fue de $644.40
-- El producto 2 es el más vendido, sin embargo el producto que más ganancias generó fue el producto 3
-- En el mes 3 el total facturado fue de 6444.00 y se encontró por debajo del promedio mensual
