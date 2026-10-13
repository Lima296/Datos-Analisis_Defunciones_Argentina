CREATE VIEW vista_analisis_completo AS
SELECT 
    -- Datos de la tabla de hechos
    f.anio,
    f.cantidad,
    
    -- Datos de la jurisdicción (unimos con la tabla de dimensiones)
    j.nombre AS provincia,
    j.poblacion_total,
    
    -- Cálculo de la Tasa de Mortalidad (Defunciones cada 100k habitantes)
    -- Usamos NULLIF para evitar errores si la población es 0 o NULL
    CAST((f.cantidad * 100000.0 / NULLIF(j.poblacion_total, 0)) AS DECIMAL(18,2)) AS tasa_mortalidad_100k,
    
    -- Datos de la causa (CIE10)
    c.cie10_causa_id AS codigo_cie10,
    c.cie10_clasificacion AS enfermedad_descripcion,
    
    -- Datos de sexo y grupo de edad
    s.sexo AS sexo,
    g.grupo AS rango_edad,
    
    -- Datos de muerte materna
    m.muerte_materna_clasificacion AS categoria_muerte_materna

FROM defunciones_argentina f
LEFT JOIN jurisdicion_residencia j ON f.jurisdiccion_de_residencia_id = j.id
LEFT JOIN cie10 c ON f.cie10_causa_id = c.cie10_causa_id
LEFT JOIN sexo s ON f.sexo_id = s.sexo_id
LEFT JOIN grupo_edad g ON f.grupo_edad = g.id
LEFT JOIN muerte_materna m ON f.muerte_materna_id = m.muerte_materna_id;