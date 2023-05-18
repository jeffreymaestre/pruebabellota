/*
a. De todos los productos listar únicamente las limas que contengan embalaje de al
menos 600 unidades.
*/

SELECT codigo, nombre_producto, stock
FROM productos
WHERE nombre_producto = 'Lima' AND stock >= 600;

/*
b. Realizar una única consulta que
muestre el año de la proforma, el consecutivo, la fecha de la proforma, el código
del cliente, el nombre del cliente, las notas del pedido, el producto y la cantidad
pedida.
*/

--Sentencia con el nombre del producto
SELECT p.anio, p.consecutivo, p.fecha_proforma, p.codigo_cliente, c.nombre_cliente, p.notas_pedido, pr.nombre_producto, dp.cantidad_pedida 
	FROM proforma p JOIN detalle_proforma dp ON p.anio = dp.anio AND p.consecutivo = dp.consecutivo 
		JOIN Clientes c ON p.codigo_cliente = c.codigo JOIN Productos pr ON dp.codigo_producto = pr.codigo 

--Sentencia con el id del producto
SELECT p.anio, p.consecutivo, p.fecha_proforma, p.codigo_cliente, c.nombre_cliente, p.notas_pedido, dp.codigo_producto, dp.cantidad_pedida 
FROM proforma p 
	JOIN detalle_proforma dp ON p.anio = dp.anio AND p.consecutivo = dp.consecutivo 
    	JOIN Clientes c ON p.codigo_cliente = c.codigo 
        	JOIN Productos pr ON dp.codigo_producto = pr.codigo 

/*
c. Por Error del sistema, en ocasiones quedan proformas que tienen detalle, pero no
tienen información de cabecera. Realizar una
consulta que permita identificar estas proformas.
*/                    
SELECT dp.anio, dp.consecutivo
FROM detalle_proforma dp
LEFT JOIN proforma p ON dp.anio = p.anio AND dp.consecutivo = p.consecutivo
WHERE p.anio IS NULL AND p.consecutivo IS NULL;

/*
d. Hacer una consulta que liste todos los productos con código y descripción y el
inventario (Stock) del producto. Tener en cuenta que la consulta debe mostrar
todos los productos independientemente de que estos tengan o no registros de
inventario.
*/

--Sentencia si solo existe una tabla producto
SELECT * FROM productos;

--Sentencia si existe una tabla productos y una tabla inventario
SELECT p.codigo, p.descripcion, COALESCE(i.stock, 0) AS inventario
FROM productos p
LEFT JOIN inventario i ON p.codigo = i.codigo_producto;
