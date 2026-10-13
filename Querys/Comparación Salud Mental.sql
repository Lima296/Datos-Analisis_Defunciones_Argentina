
--TASA DE AUTOLESIONES POR PROVINCIA
SELECT
    provincia,
    SUM(cantidad) AS Total_Autolesiones,
    poblacion_total,
    -- Calculamos la tasa
	ROUND((SUM(cantidad) * 100000.0 / poblacion_total), 2) AS Tasa_Autolesion_100k
FROM vista_analisis_completo
WHERE codigo_cie10 BETWEEN 'X60' AND 'X84' AND poblacion_total != 0 AND anio = 2024
GROUP BY provincia, poblacion_total
ORDER BY Tasa_Autolesion_100k DESC;

--COMPARAMOS CODIGO DE ESTABLECIMIENTOS DE SALUD MENTAL
SELECT PROVINCIA_NOMBRE, ESTABLECIMIENTO_NOMBRE, TIPOLOGIA_NOMBRE, ORIGEN_FINANCIAMIENTO
FROM establecimientos_2024
WHERE TIPOLOGIA_SIGLA = 'ESCIESM' 
  AND (PROVINCIA_NOMBRE = 'SALTA' OR PROVINCIA_NOMBRE = 'CATAMARCA')
ORDER BY PROVINCIA_NOMBRE, ORIGEN_FINANCIAMIENTO;

SELECT 
    p.nombre AS Provincia,
    p.poblacion_total,
    COUNT(e.establecimiento_id) AS Cantidad_ESCIESM,
    -- Calculamos cuántos centros hay cada 100.000 habitantes
    ROUND((COUNT(e.establecimiento_id) * 100000.0 / p.poblacion_total), 4) AS Tasa_Centros_SM_100k
FROM jurisdicion_residencia p
LEFT JOIN establecimientos_2024 e ON p.id = e.provincia_id 
    AND e.tipologia_sigla = 'ESCIESM'
	WHERE poblacion_total != 0
GROUP BY p.nombre, p.poblacion_total
ORDER BY Tasa_Centros_SM_100k DESC;

--ESTA ES UNA TASA POR CENTRO, MEJOR PARA DEMOSTRAR X HABITANTES POR CENTRO.
--CUANTOS HABITANTES DEBEN ACUDIR A UN CENTRO
	SELECT 
    p.nombre AS Provincia,
    p.poblacion_total,
    COUNT(e.establecimiento_id) AS Cantidad_ESCIESM,
    -- Si no hay centros, el ratio es la población entera. 
    -- Si hay, dividimos población por cantidad de centros.
    CASE 
        WHEN COUNT(e.establecimiento_id) = 0 THEN p.poblacion_total 
        ELSE (p.poblacion_total / COUNT(e.establecimiento_id)) 
    END AS Habitantes_por_Centro
FROM jurisdicion_residencia p
LEFT JOIN establecimientos_2024 e ON p.id = e.provincia_id 
    AND e.tipologia_sigla = 'ESCIESM'
GROUP BY p.nombre, p.poblacion_total
ORDER BY Habitantes_por_Centro DESC;

select provincia, sum(cantidad) as cantidad_total
from vista_analisis_completo
WHERE codigo_cie10 BETWEEN 'X60' AND 'X84' AND poblacion_total != 0 and anio between '2017' and '2024'
group by provincia
order by 2 desc
