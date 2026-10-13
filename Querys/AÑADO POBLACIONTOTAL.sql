--PARA EL ANALISIS VAMOS A NECESITAR POBLACION
--INDEC CENSO 2022 FUENTE OFICIAL TOMAMOS DESDE AQUI LOS DATOS
--MODIFICAMOS Y AGREGAMOS DIRECTAMENTE EN NUESTRA TABLA JURISDICCIONES

/*
ALTER TABLE jurisdicion_residencia
ADD poblacion_total INT;
*/

select * from jurisdicion_residencia

UPDATE jurisdicion_residencia SET poblacion_total = 3121707 WHERE id = '02'; -- CABA
UPDATE jurisdicion_residencia SET poblacion_total = 17553136 WHERE id = '06'; -- Buenos Aires
UPDATE jurisdicion_residencia SET poblacion_total = 429562 WHERE id = '10'; -- Catamarca
UPDATE jurisdicion_residencia SET poblacion_total = 3980125 WHERE id = '14'; -- Córdoba
UPDATE jurisdicion_residencia SET poblacion_total = 1212696 WHERE id = '18'; -- Corrientes
UPDATE jurisdicion_residencia SET poblacion_total = 1143014 WHERE id = '22'; -- Chaco
UPDATE jurisdicion_residencia SET poblacion_total = 618394 WHERE id = '26'; -- Chubut
UPDATE jurisdicion_residencia SET poblacion_total = 1425078 WHERE id = '30'; -- Entre Ríos
UPDATE jurisdicion_residencia SET poblacion_total = 607419 WHERE id = '34'; -- Formosa
UPDATE jurisdicion_residencia SET poblacion_total = 811611 WHERE id = '38'; -- Jujuy
UPDATE jurisdicion_residencia SET poblacion_total = 366111 WHERE id = '42'; -- La Pampa
UPDATE jurisdicion_residencia SET poblacion_total = 383865 WHERE id = '46'; -- La Rioja
UPDATE jurisdicion_residencia SET poblacion_total = 2043540 WHERE id = '50'; -- Mendoza
UPDATE jurisdicion_residencia SET poblacion_total = 1278873 WHERE id = '54'; -- Misiones
UPDATE jurisdicion_residencia SET poblacion_total = 710814 WHERE id = '58'; -- Neuquén
UPDATE jurisdicion_residencia SET poblacion_total = 750768 WHERE id = '62'; -- Río Negro
UPDATE jurisdicion_residencia SET poblacion_total = 1441358 WHERE id = '66'; -- Salta
UPDATE jurisdicion_residencia SET poblacion_total = 822853 WHERE id = '70'; -- San Juan
UPDATE jurisdicion_residencia SET poblacion_total = 542069 WHERE id = '74'; -- San Luis
UPDATE jurisdicion_residencia SET poblacion_total = 337226 WHERE id = '78'; -- Santa Cruz
UPDATE jurisdicion_residencia SET poblacion_total = 3544908 WHERE id = '82'; -- Santa Fe
UPDATE jurisdicion_residencia SET poblacion_total = 1060906 WHERE id = '86'; -- Santiago del Estero
UPDATE jurisdicion_residencia SET poblacion_total = 1731820 WHERE id = '90'; -- Tucumán
UPDATE jurisdicion_residencia SET poblacion_total = 185732 WHERE id = '94'; -- Tierra del Fuego


