select * from defunciones_argentina

SELECT 
SUBSTRING(grupo_edad,1,2)
FROM defunciones_argentina

SELECT DISTINCT 
    grupo_edad AS original, 
    SUBSTRING(grupo_edad, 1, 2) AS resultado_update
FROM defunciones_argentina;

UPDATE defunciones_argentina
SET grupo_edad = SUBSTRING(grupo_edad, 1, 2);