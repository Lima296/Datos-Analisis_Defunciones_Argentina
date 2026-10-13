select distinct grupo_edad


select DISTINCT
CHARINDEX('.',grupo_edad) --ESTA CONSULTA NOS INDICA EN QUE POSICIÓN ESTÁ EL PUNTO QUE SEPARA EL GRUPO DE SU DESCRIPCION EN EL TEXTO
from defunciones_argentina --SABEMOS QUE EL PUNTO ESTA EN LA POSICION 3

SELECT DISTINCT
SUBSTRING(grupo_edad,1,2) as ID
from defunciones_argentina
order by 1 --Esta consulta saca el "ID" del grupo_edad

SELECT DISTINCT
SUBSTRING(grupo_edad,4,LEN(grupo_edad)) as NOMBRE
from defunciones_argentina
order by 1 --Con lo que ya sabemos, esta consulta nos devuelve el "nombre" del grupo_edad

--Con esas dos consultas podemos separar en columnas
SELECT DISTINCT
SUBSTRING(grupo_edad,1,2) as ID,
SUBSTRING(grupo_edad,4,LEN(grupo_edad)) as NOMBRE
from defunciones_argentina
order by 1

--Creamos y llenamos la tabla
CREATE TABLE grupo_edad(id int,grupo nvarchar(50))

INSERT INTO grupo_edad(id,grupo)
SELECT DISTINCT
SUBSTRING(grupo_edad,1,2),
SUBSTRING(grupo_edad,4,LEN(grupo_edad))
from defunciones_argentina

select * from grupo_edad
