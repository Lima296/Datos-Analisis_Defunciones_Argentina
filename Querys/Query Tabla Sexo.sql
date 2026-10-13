--SELECT distinct sexo, sexo_id from [dbo].[defunciones_argentina]

CREATE TABLE sexo (sexo_id int, sexo nvarchar(50)) --CREAMOS LA TABLA SEXO

INSERT INTO sexo (sexo_id, sexo)
SELECT DISTINCT sexo_id, sexo
FROM defunciones_argentina
WHERE sexo_id IS NOT NULL;

select * from sexo

