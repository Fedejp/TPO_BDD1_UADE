/* --3.5)Crear un procedimiento que proyecte los estudios que están cubiertos por una determinada obra social. 
INPUT: nombre de la obra social, nombre del plan ( default null ). 
Proyectar los estudios y la cobertura que poseen (estudio y porcentaje cubierto. 
Si no se ingresa plan, se deben listar todos los planes de la obra social.  */

CREATE PROCEDURE pr_EstudiosPorObraSocial
	@plan  varchar(50)=null,
	@obrasocial varchar(50)
AS 
IF (@plan IS NULL)
    BEGIN
       SELECT os.Nombre, p.NombrePlan, e.Descripcion, c.Cobertura
       FROM ObraSocial os INNER JOIN Planes p ON os.Sigla= p.sigla
                          INNER JOIN Coberturas c ON  c.Sigla=p.Sigla AND p.NroPlan= c.NroPlan
                          JOIN Estudios e on c.IdEstudio=e.IdEstudio
       WHERE  os.nombre=@obrasocial
    END
ELSE
    BEGIN
       SELECT os.Nombre, p.NombrePlan, e.Descripcion, c.Cobertura
       FROM	ObraSocial os INNER JOIN Planes p ON os.Sigla= p.sigla
                              INNER JOIN Coberturas c ON  c.Sigla=p.Sigla AND p.NroPlan= c.NroPlan
                              INNER JOIN Estudios e ON e.IdEstudio=c.IdEstudio  
       WHERE  os.Nombre=@obrasocial and p.NombrePlan=@plan
    END

