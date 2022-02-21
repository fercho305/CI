--   IMPLT_pricing

TRUNCATE TABLE   IMPLT_pricing
GO

INSERT INTO  IMPLT_pricing (Secuence, Code_Table, Code1, Code2, Code3, Code4, Code5, Code6, Code7, 
Code8, Value, Base, Unit_Measure, Type_Value, Code_Currency, Date_Ini, Date_Fin, ValueKey, ID_ERP, 
Quantity_Ini, Quantity_End, Type_S,
Source_Create, 
                         Transfer_status, Status_SAP)

SELECT DISTINCT 'ZPR0' AS Secuence, 
CASE WHEN ListaDePrecio.Codigo_Material IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
ListaDePrecio.Grupo_Cliente AS Code1,

ListaDePrecio.Grupo_Cliente AS Code2,

CASE WHEN right(ListaDePrecio.Codigo_Material,12) IS NOT NULL THEN right(ListaDePrecio.Codigo_Material,12)
ELSE CASE WHEN len(jerarquia) = 2 THEN jerarquia
ELSE CASE WHEN len(jerarquia) = 4 THEN Substring (jerarquia, 3,2)
ELSE CASE WHEN len(jerarquia) = 6 THEN Substring (jerarquia, 5,2)
ELSE CASE WHEN len(jerarquia) = 8 THEN Substring (jerarquia, 7,2)
ELSE CASE WHEN len(jerarquia) = 10 THEN Substring (jerarquia, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
substring(cast(max(Precio) AS varchar(14)),1,12) as Value, 
1 AS Base,
Unidad_Venta AS Unit_Measure, 
0 AS Type_Value, 
'PE' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZPR0' + Nivel_Precio + ListaDePrecio.Grupo_Cliente + Reg_Condicion 
+ right(ListaDePrecio.Codigo_Material,12) AS ValueKey, 
Reg_Condicion AS ID_ERP, 
NULL AS Quantity_Ini, NULL AS Quantity_End, 'N' AS Type_S,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            ListaDePrecio
INNER JOIN Materiales ON Materiales.codigo_material = ListaDePrecio.Codigo_Material
INNER JOIN Clientes ON 
Clientes.Grupo_Cliente = ListaDePrecio.Grupo_Cliente

WHERE  Nivel_Precio = 'A910'
GROUP BY ListaDePrecio.Codigo_Material, Jerarquia, Nivel_Precio, ListaDePrecio.Grupo_Cliente, Unidad_Venta,
Fecha_inicio, Fecha_Fin, Reg_Condicion, Clientes.CODIGO_CLIENTE, Clientes.RAMO, Clientes.CODIGO_ZONA
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
UNION

SELECT DISTINCT 'ZPR0' AS Secuence, 
CASE WHEN ListaDePrecio.Codigo_Material IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
ListaDePrecio.Grupo_Cliente AS Code1,

Clientes.Codigo_Cliente AS Code2,

CASE WHEN right(ListaDePrecio.Codigo_Material,12) IS NOT NULL THEN right(ListaDePrecio.Codigo_Material,12)
ELSE CASE WHEN len(jerarquia) = 2 THEN jerarquia
ELSE CASE WHEN len(jerarquia) = 4 THEN Substring (jerarquia, 3,2)
ELSE CASE WHEN len(jerarquia) = 6 THEN Substring (jerarquia, 5,2)
ELSE CASE WHEN len(jerarquia) = 8 THEN Substring (jerarquia, 7,2)
ELSE CASE WHEN len(jerarquia) = 10 THEN Substring (jerarquia, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
substring(cast(max(Precio) AS varchar(14)),1,12) as Value, 
1 AS Base,
Unidad_Venta AS Unit_Measure, 
0 AS Type_Value, 
'PE' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZPR0' + Nivel_Precio + ListaDePrecio.Grupo_Cliente + Reg_Condicion 
+ right(ListaDePrecio.Codigo_Material,12) AS ValueKey, 
Reg_Condicion AS ID_ERP, 
NULL AS Quantity_Ini, NULL AS Quantity_End, 'N' AS Type_S,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            ListaDePrecio
INNER JOIN Materiales ON Materiales.codigo_material = ListaDePrecio.Codigo_Material
INNER JOIN Clientes ON 
Clientes.Codigo_Cliente = ListaDePrecio.Cliente
WHERE  Nivel_Precio = 'A928'
GROUP BY ListaDePrecio.Codigo_Material, Jerarquia, Nivel_Precio, ListaDePrecio.Grupo_Cliente, Unidad_Venta,
Fecha_inicio, Fecha_Fin, Reg_Condicion, Clientes.CODIGO_CLIENTE, Clientes.RAMO, Clientes.CODIGO_ZONA
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
INSERT INTO  IMPLT_pricing (Secuence, Code_Table, Code1, Code2, Code3, Code4, Code5, Code6, Code7, 
Code8, Value, Base, Unit_Measure, Type_Value, Code_Currency, Date_Ini, Date_Fin, ValueKey, ID_ERP, 
Quantity_Ini, Quantity_End, Type_S,
Source_Create, 
                         Transfer_status, Status_SAP)

SELECT DISTINCT 'ZPR0' AS Secuence, 
CASE WHEN ListaDePrecio.Codigo_Material IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
ListaDePrecio.Grupo_Cliente AS Code1,

Clientes.Ramo AS Code2,

CASE WHEN right(ListaDePrecio.Codigo_Material,12) IS NOT NULL THEN right(ListaDePrecio.Codigo_Material,12)
ELSE CASE WHEN len(jerarquia) = 2 THEN jerarquia
ELSE CASE WHEN len(jerarquia) = 4 THEN Substring (jerarquia, 3,2)
ELSE CASE WHEN len(jerarquia) = 6 THEN Substring (jerarquia, 5,2)
ELSE CASE WHEN len(jerarquia) = 8 THEN Substring (jerarquia, 7,2)
ELSE CASE WHEN len(jerarquia) = 10 THEN Substring (jerarquia, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
substring(cast(max(Precio) AS varchar(14)),1,12) as Value, 
1 AS Base,
Unidad_Venta AS Unit_Measure, 
0 AS Type_Value, 
'PE' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZPR0' + Nivel_Precio + ListaDePrecio.Grupo_Cliente + Reg_Condicion 
+ right(ListaDePrecio.Codigo_Material,12) AS ValueKey, 
Reg_Condicion AS ID_ERP, 
NULL AS Quantity_Ini, NULL AS Quantity_End, 'N' AS Type_S,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            ListaDePrecio
INNER JOIN Materiales ON Materiales.codigo_material = ListaDePrecio.Codigo_Material
INNER JOIN Clientes ON 
Clientes.Ramo = ListaDePrecio.RAMO
WHERE  Nivel_Precio = 'A934'
GROUP BY ListaDePrecio.Codigo_Material, Jerarquia, Nivel_Precio, ListaDePrecio.Grupo_Cliente, Unidad_Venta,
Fecha_inicio, Fecha_Fin, Reg_Condicion, Clientes.CODIGO_CLIENTE, Clientes.RAMO, Clientes.CODIGO_ZONA
------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
UNION 

SELECT DISTINCT 'ZPR0' AS Secuence, 
CASE WHEN ListaDePrecio.Codigo_Material IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
ListaDePrecio.Grupo_Cliente AS Code1,

Clientes.CODIGO_ZONA AS Code2,

CASE WHEN right(ListaDePrecio.Codigo_Material,12) IS NOT NULL THEN right(ListaDePrecio.Codigo_Material,12)
ELSE CASE WHEN len(jerarquia) = 2 THEN jerarquia
ELSE CASE WHEN len(jerarquia) = 4 THEN Substring (jerarquia, 3,2)
ELSE CASE WHEN len(jerarquia) = 6 THEN Substring (jerarquia, 5,2)
ELSE CASE WHEN len(jerarquia) = 8 THEN Substring (jerarquia, 7,2)
ELSE CASE WHEN len(jerarquia) = 10 THEN Substring (jerarquia, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
substring(cast(max(Precio) AS varchar(14)),1,12) as Value, 
1 AS Base,
Unidad_Venta AS Unit_Measure, 
0 AS Type_Value, 
'PE' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZPR0' + Nivel_Precio + ListaDePrecio.Grupo_Cliente + Reg_Condicion 
+ right(ListaDePrecio.Codigo_Material,12) AS ValueKey, 
Reg_Condicion AS ID_ERP, 
NULL AS Quantity_Ini, NULL AS Quantity_End, 'N' AS Type_S,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            ListaDePrecio
INNER JOIN Materiales ON Materiales.codigo_material = ListaDePrecio.Codigo_Material
INNER JOIN Clientes ON 
Clientes.CODIGO_ZONA = ListaDePrecio.ZONA
WHERE  Nivel_Precio = 'A943'
GROUP BY ListaDePrecio.Codigo_Material, Jerarquia, Nivel_Precio, ListaDePrecio.Grupo_Cliente, Unidad_Venta,
Fecha_inicio, Fecha_Fin, Reg_Condicion, Clientes.CODIGO_CLIENTE, Clientes.RAMO, Clientes.CODIGO_ZONA
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
UNION
SELECT        'MWST' AS Secuence, 'A003' AS Code_Table,
'2' AS Code1, '17' AS Code2, '18' AS Code3, 
NULL AS Code4, NULL AS Code5, NULL AS Code6, NULL
                         AS Code7, NULL AS Code8, '0.000' AS Value, 1 AS Base,
						 '%' AS Unit_Measure, '1' AS Type_Value, 'RD' AS Code_Currency,
						 '20140101' AS Date_Ini, '20990101' AS Date_Fin,
 'A003217' AS ValueKey, 'MWSTA003217' AS ID_ERP,  --'' AS Articulo,
						 NULL AS Quantity_Ini, NULL AS Quantity_End, 'N' AS Type_S,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
---------------------------------------------------------------
---------------------------------------------------------------
--Precios_Descuentos
TRUNCATE TABLE [IMPLT_pricing_esc]
GO

INSERT INTO [dbo].[IMPLT_pricing_esc]
           ([Secuence]
           ,[Code_Table]
           ,[Code1]
           ,[Code2]
           ,[Code3]
           ,[Code4]
           ,[Code5]
           ,[Code6]
           ,[Code7]
           ,[Code8]
           ,[Value]
           ,[Base]
           ,[Unit_Measure]
           ,[Type_Value]
           ,[Code_Currency]
           ,[Date_Ini]
           ,[Date_Fin]
           ,[ValueKey]
           ,[ID_ERP]
           ,[Quantity_Ini]
           ,[Quantity_End]
           ,[Type_S]
           ,[Price_Min]
           ,[Price_Max]
           ,[Source_Create]
           ,[Transfer_status]
           ,[Status_SAP])
     SELECT  'ZDC1' AS Secuence, 
CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
Descuentos.Grupo_Cliente AS Code1,

Descuentos.Grupo_Cliente AS Code2, 

CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN right(Codigo_Material,12)
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN jerarquia_producto
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Substring (jerarquia_producto, 3,2)
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Substring (jerarquia_producto, 5,2)
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Substring (jerarquia_producto, 7,2)
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Substring (jerarquia_producto, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
cast(max(PCTO_Descuento) AS varchar(12)) as Value, 
1 AS Base,
'%' AS Unit_Measure, 
1 AS Type_Value, 
'%' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZDC1' + Nivel_Precio + Descuentos.Grupo_Cliente + Registro_Condicion + right(Codigo_Material,12) AS ValueKey, 
Registro_Condicion AS ID_ERP, 
CANT_DESDE AS Quantity_Ini, CANT_HASTA AS Quantity_End, 'E' AS Type_S,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_min,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_max,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            Descuentos 
INNER JOIN Clientes ON 
Clientes.Grupo_Cliente = Descuentos.Grupo_Cliente

WHERE  Nivel_Precio = 'A910'
GROUP BY Codigo_Material, Nivel_Precio, jerarquia_producto, Registro_Condicion, Descuentos.Grupo_Cliente, Fecha_Inicio,
Fecha_Fin, CANT_DESDE, CANT_HASTA
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
UNION

     SELECT  'ZDC1' AS Secuence, 
CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
Descuentos.Grupo_Cliente AS Code1,

Descuentos.Cliente AS Code2,

CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN right(Codigo_Material,12)
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN jerarquia_producto
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Substring (jerarquia_producto, 3,2)
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Substring (jerarquia_producto, 5,2)
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Substring (jerarquia_producto, 7,2)
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Substring (jerarquia_producto, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
cast(max(PCTO_Descuento) AS varchar(12)) as Value, 
1 AS Base,
'%' AS Unit_Measure, 
1 AS Type_Value, 
'%' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZDC1' + Nivel_Precio + Descuentos.Grupo_Cliente + Registro_Condicion + right(Codigo_Material,12) AS ValueKey, 
Registro_Condicion AS ID_ERP, 
CANT_DESDE AS Quantity_Ini, CANT_HASTA AS Quantity_End, 'E' AS Type_S,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_min,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_max,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            Descuentos
INNER JOIN Clientes ON 
Clientes.Codigo_Cliente = Descuentos.Cliente
WHERE  Nivel_Precio = 'A928'
GROUP BY Codigo_Material, Nivel_Precio, jerarquia_producto, Registro_Condicion, Descuentos.Grupo_Cliente, Fecha_Inicio,
Fecha_Fin, CANT_DESDE, CANT_HASTA, Descuentos.CLIENTE

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[IMPLT_pricing_esc]
           ([Secuence]
           ,[Code_Table]
           ,[Code1]
           ,[Code2]
           ,[Code3]
           ,[Code4]
           ,[Code5]
           ,[Code6]
           ,[Code7]
           ,[Code8]
           ,[Value]
           ,[Base]
           ,[Unit_Measure]
           ,[Type_Value]
           ,[Code_Currency]
           ,[Date_Ini]
           ,[Date_Fin]
           ,[ValueKey]
           ,[ID_ERP]
           ,[Quantity_Ini]
           ,[Quantity_End]
           ,[Type_S]
           ,[Price_Min]
           ,[Price_Max]
           ,[Source_Create]
           ,[Transfer_status]
           ,[Status_SAP])

     SELECT  'ZDC1' AS Secuence, 
CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
Descuentos.Grupo_Cliente AS Code1,

Clientes.Ramo AS Code2,

CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN right(Codigo_Material,12)
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN jerarquia_producto
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Substring (jerarquia_producto, 3,2)
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Substring (jerarquia_producto, 5,2)
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Substring (jerarquia_producto, 7,2)
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Substring (jerarquia_producto, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
cast(max(PCTO_Descuento) AS varchar(12)) as Value, 
1 AS Base,
'%' AS Unit_Measure, 
1 AS Type_Value, 
'%' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZDC1' + Nivel_Precio + Descuentos.Grupo_Cliente + Registro_Condicion + right(Codigo_Material,12) AS ValueKey, 
Registro_Condicion AS ID_ERP, 
CANT_DESDE AS Quantity_Ini, CANT_HASTA AS Quantity_End, 'E' AS Type_S,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_min,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_max,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            Descuentos
INNER JOIN Clientes ON 
Clientes.Ramo = Descuentos.RAMO
WHERE  Nivel_Precio = 'A934'
GROUP BY Codigo_Material, Nivel_Precio, jerarquia_producto, Registro_Condicion, Descuentos.Grupo_Cliente, Fecha_Inicio,
Fecha_Fin, CANT_DESDE, CANT_HASTA, Clientes.RAMO



--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
UNION

     SELECT  'ZDC1' AS Secuence, 
CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN Nivel_Precio
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN Nivel_Precio + '_1'
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Nivel_Precio + '_2'
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Nivel_Precio + '_3'
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Nivel_Precio + '_4'
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Nivel_Precio + '_5'  
END END END END END END AS Code_Table, 
Descuentos.Grupo_Cliente AS Code1,

Clientes.CODIGO_ZONA AS Code2,

CASE WHEN right(Codigo_Material,12) IS NOT NULL THEN right(Codigo_Material,12)
ELSE CASE WHEN len(jerarquia_producto) = 2 THEN jerarquia_producto
ELSE CASE WHEN len(jerarquia_producto) = 4 THEN Substring (jerarquia_producto, 3,2)
ELSE CASE WHEN len(jerarquia_producto) = 6 THEN Substring (jerarquia_producto, 5,2)
ELSE CASE WHEN len(jerarquia_producto) = 8 THEN Substring (jerarquia_producto, 7,2)
ELSE CASE WHEN len(jerarquia_producto) = 10 THEN Substring (jerarquia_producto, 9,2)
END END END END END END AS Code3,
NULL AS Code4, 
NULL AS Code5, 
NULL AS Code6, 
NULL AS Code7, 
NULL AS Code8, 
cast(max(PCTO_Descuento) AS varchar(12)) as Value, 
1 AS Base,
'%' AS Unit_Measure, 
1 AS Type_Value, 
'%' AS Code_Currency, 
CONVERT(varchar,Fecha_Inicio,112) AS Date_Ini,
CONVERT(varchar,Fecha_Fin,112)AS Date_Fin, 
'ZDC1' + Nivel_Precio + Descuentos.Grupo_Cliente + Registro_Condicion + right(Codigo_Material,12) AS ValueKey, 
Registro_Condicion AS ID_ERP, 
CANT_DESDE AS Quantity_Ini, CANT_HASTA AS Quantity_End, 'E' AS Type_S,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_min,
cast(max(promocion_ventas) AS decimal(11,3)) AS price_max,
'0' AS Source_Create, 
1 AS transfer_status, 
0  AS status_SAP
FROM            Descuentos
INNER JOIN Clientes ON 
Clientes.CODIGO_ZONA = Descuentos.ZONA
WHERE  Nivel_Precio = 'A943'
GROUP BY Codigo_Material, Nivel_Precio, jerarquia_producto, Registro_Condicion, Descuentos.Grupo_Cliente, Fecha_Inicio,
Fecha_Fin, CANT_DESDE, CANT_HASTA, Clientes.CODIGO_ZONA