select distinct jurisdiccion_de_residencia_id,jurisdicion_residencia_nombre from defunciones_argentina
WHERE jurisdicion_residencia_nombre IS NOT NULL

CREATE TABLE jurisdicion_residencia(id int, nombre nvarchar(100))

INSERT INTO jurisdicion_residencia(id,nombre)
select distinct jurisdiccion_de_residencia_id,jurisdicion_residencia_nombre from defunciones_argentina
WHERE jurisdicion_residencia_nombre IS NOT NULL

select * from jurisdicion_residencia