-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- Esta consulta sirve para tener una vista unificada y descriptiva sobre cada venta, el cliente y el tipo de producto vendido. 

SELECT
	v.id_venta,
	v.fecha_venta,
	c.nombre AS cliente,
	c.ciudad,
	p.nombre_producto AS producto,
	ct.descripcion AS categoria,
	v.cantidad,
	v.precio_unitario,
	v.cantidad * v.precio_unitario AS total_venta
FROM
	ventas AS v
INNER JOIN
	clientes AS c
ON
	v.id_cliente = c.id_cliente
INNER JOIN
	productos AS p
ON
	v.id_producto = p.id_producto
INNER JOIN
	categorias AS ct
ON	
	p.id_categoria = ct.id_categoria
ORDER BY cliente;

-- Hallazgo: Se encontraron un total de 10 ventas, realizadas entre el 2024-03-05 y 2024-03-15.


-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Esta consulta sirve para identificar clientes que se han registrado pero todavia no han realizado ninguna compra

SELECT
	c.nombre AS cliente,
	c.email,
	c.fecha_registro,
	v.id_venta
FROM
	clientes AS c
LEFT JOIN
	ventas AS v
ON
	c.id_cliente = v.id_cliente
WHERE
	v.id_venta IS NULL;

-- Hallazgo: Se encontró un total de 0 clientes registrados sin ventas.


-- Consulta 3 — Productos sin ventas (LEFT JOIN)
-- Esta consulta sirve para identificar productos del catalogo que no han tenido ni una sola venta
SELECT
	p.nombre_producto AS producto,
	c.nombre_categoria AS categoria,
	v.precio_unitario
FROM
	productos AS p
LEFT JOIN 
	categorias AS c
ON
	p.id_categoria = c.id_categoria
LEFT JOIN
	ventas AS v
ON
	p.id_producto = v.id_producto
WHERE v.id_venta IS NULL

-- Hallazgo: Se encontró un total de 0 productos sin ventas, es decir todos los productos cuentan con al menos 1 venta registrada.


-- Consulta 4 — Consolidado por canal (UNION ALL)
--Esta consulta sirve para segmentar las ventas por semana de venta y visualizar las ventas totales de cada periodo

SELECT 
	canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Semana 1' AS canal
    FROM ventas WHERE fecha_venta <= '2024-03-07'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Semana 2' AS canal
    FROM ventas WHERE fecha_venta > '2024-03-07' AND fecha_venta < '2024-03-16'
) AS consolidado
GROUP BY canal;

-- Hallazgo: Se encontró un total de ventas de $2990.00 en la Semana 1 y un total de ventas de $3454.00 en la Semana 2.
