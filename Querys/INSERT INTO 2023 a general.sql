/*
INSERT INTO defunciones_argentina (
    anio, 
    sexo_id, 
    jurisdiccion_de_residencia_id, 
    cie10_causa_id, 
    grupo_edad, 
    cantidad
)
SELECT 
    anio, 
    sexo_id, 
    jurisdiccion_de_residencia_id, 
    cie10_causa_id, 
    grupo_edad, --
    cantidad
FROM defunciones_argentina_2024;
*/

SELECT anio, SUM(cantidad) as total_fallecidos
FROM defunciones_argentina
GROUP BY anio
ORDER BY anio;

WITH resumen_provincial AS (
    SELECT 
        anio,
        provincia,
        SUM(cantidad) AS muertes_provincia,
        MAX(poblacion_total) AS poblacion_provincia
    FROM vista_analisis_completo
    GROUP BY anio, provincia
)
SELECT 
    anio,
    SUM(cantidad) AS total_fallecidos,
    SUM(poblacion_total) AS poblacion_nacional,
    ROUND((SUM(cantidad)::numeric / SUM(poblacion_total)) * 100000, 2) AS tasa_mortalidad_100k
FROM vista_analisis_completo
GROUP BY anio
ORDER BY anio;