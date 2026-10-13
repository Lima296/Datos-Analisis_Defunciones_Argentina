--	Tasa de mortalidad por Provincia y Año CADA CIEN MIL HABITANTES
SELECT 
    provincia AS Provincia, 
    SUM(cantidad) AS Defunciones,
    -- Calculamos la tasa sobre el total sumado de la provincia
    CAST((SUM(cantidad) * 100000.0 / MAX(poblacion_total)) AS DECIMAL(18,2)) AS 'Tasa de Mortalidad cada cien mil habitantes',
	anio as Año
FROM vista_analisis_completo
WHERE provincia != 'Sin información'
GROUP BY provincia, anio
ORDER BY anio DESC; --ordenado por la tasa de mortalidad

--Causas de defunciones más comunes
select TOP 20 enfermedad_descripcion,
sum(cantidad) as Cantidad_Defunciones
from vista_analisis_completo
GROUP BY enfermedad_descripcion order by 2 desc

--Cantidad de defunciones por clasificación
select 
codigo_cie10 as CIE10ID,
enfermedad_descripcion as CIE10CLASIFICACIÓN,
sum(cantidad) as Cantidad_defunciones
from vista_analisis_completo
GROUP BY codigo_cie10, enfermedad_descripcion
ORDER BY 3 desc

--Cantidad de defunciones por Clasificación y Provincia
select 
codigo_cie10 as CIE10ID,
enfermedad_descripcion as CIE10CLASIFICACIÓN,
provincia as Provincia,
sum(cantidad) as Cantidad_defunciones
from vista_analisis_completo
GROUP BY codigo_cie10, enfermedad_descripcion, provincia
ORDER BY 4 desc

--Defunciones más comunes por sexo
select
TOP 30 enfermedad_descripcion,
sexo as Sexo,
sum(cantidad) as Cantidad
from vista_analisis_completo
where sexo = 'masculino' 
group by enfermedad_descripcion, sexo
order by 2, 3 desc

--CAUSAS MAS COMUNES - MUERTES EXTERNAS
SELECT TOP 30
    enfermedad_descripcion,
    SUM(cantidad) as Total,
    sexo
FROM vista_analisis_completo
WHERE (codigo_cie10 LIKE 'V%' OR codigo_cie10 LIKE 'X%' OR codigo_cie10 LIKE 'Y%') -- Paréntesis clave
  AND sexo = 'masculino'
GROUP BY enfermedad_descripcion, sexo
ORDER BY Total DESC;
--añadido
select sum(cantidad), sexo
from vista_analisis_completo 
group by sexo


--CAUSA MAS COMUN EDAD Y AÑO 
WITH ranking_causa_principal AS (
    SELECT 
        anio,
        rango_edad,
        codigo_cie10,
        enfermedad_descripcion,
        SUM(cantidad) AS total_defunciones,
        ROW_NUMBER() OVER (
            PARTITION BY anio, rango_edad 
            ORDER BY SUM(cantidad) DESC
        ) AS orden
    FROM dbo.vista_analisis_completo
    WHERE anio IS NOT NULL 
      AND rango_edad IS NOT NULL
    GROUP BY 
        anio, 
        rango_edad, 
        codigo_cie10, 
        enfermedad_descripcion
)
SELECT 
    anio,
    rango_edad,
    codigo_cie10,
    enfermedad_descripcion,
    total_defunciones
FROM ranking_causa_principal
WHERE orden = 1
ORDER BY 
    anio ASC, 
    rango_edad ASC;
