
--CREATE TABLE cie10 (cie10_causa_id nvarchar(10) PRIMARY KEY, cie10_clasificacion nvarchar(max))

--SELECT DISTINCT cie10_causa_id from defunciones_argentina /* 1498 reg*/ SELECT DISTINCT cie10_clasificacion from defunciones_argentina /* 1494 reg*/

SELECT DISTINCT cie10_causa_id, cie10_clasificacion from defunciones_argentina
WHERE cie10_clasificacion IS NULL or cie10_clasificacion = '' /* Revisamos NULLS o Vacíos - 15 reg */

/* Vamos a etiquetar los anteriores como "Sin clasificación" (Aunque podria eliminar los NULLS directamente) */
UPDATE defunciones_argentina
SET cie10_clasificacion = 'Sin clasificación'
WHERE cie10_clasificacion IS NULL OR cie10_clasificacion = '';

select cie10_causa_id, cie10_clasificacion from defunciones_argentina
group by cie10_causa_id, cie10_clasificacion

SELECT cie10_causa_id, COUNT(*) AS repeticiones
FROM (
    SELECT DISTINCT cie10_causa_id, cie10_clasificacion
    FROM defunciones_argentina
) AS consulta_origen
GROUP BY cie10_causa_id
HAVING COUNT(*) > 1;
-- VEMOS LOS ID DUPLICADOS

--borramos los duplicados que les colocamos Sin clasificacion
DELETE FROM defunciones_argentina
WHERE cie10_clasificacion = 'Sin clasificación'
AND cie10_causa_id IN ('b99', 'c18', 'i50', 'j18', 'k74', 'k80', 'k83', 'n18', 'p28', 'w74');

--Verificamos que ya no existan duplicados de ID
SELECT cie10_causa_id, COUNT(DISTINCT cie10_clasificacion)
FROM defunciones_argentina
GROUP BY cie10_causa_id
HAVING COUNT(DISTINCT cie10_clasificacion) > 1;

/* Ahora colocamos los datos en nuestra tabla cie10 para normalizar la BD*/
INSERT INTO cie10 (cie10_causa_id, cie10_clasificacion)
SELECT DISTINCT cie10_causa_id, cie10_clasificacion
FROM defunciones_argentina
	