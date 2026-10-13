

SELECT *
FROM cie10
WHERE cie10_clasificacion = 'Sin clasificación'

/*
En los DATASET estos ID de CIE10 se encontraban sin clasificacion, NULL, a lo que yo le coloqué SIN CLASIFICACION.
Ya que estos son codigos internacionales dictados por la OMS, investigo a que pertenecen y les coloco la descripcion correspondiente
*/

UPDATE cie10 SET cie10_clasificacion = 'Enfermedad por coronavirus (COVID-19)' WHERE cie10_causa_id = 'U07';
UPDATE cie10 SET cie10_clasificacion = 'Síndrome inflamatorio multisistémico (COVID-19)' WHERE cie10_causa_id = 'U10';
UPDATE cie10 SET cie10_clasificacion = 'Efectos adversos vacunas COVID-19' WHERE cie10_causa_id = 'U12';
UPDATE cie10 SET cie10_clasificacion = 'Hemorroides' WHERE cie10_causa_id = 'I84';
UPDATE cie10 SET cie10_clasificacion = 'Hallazgos anormales en pruebas de laboratorio' WHERE cie10_causa_id = 'R97';
--Ahora, todas mis causas estan clasificadas.
