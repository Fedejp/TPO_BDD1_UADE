/* Crear un procedimiento que proyecte cantidad de estudios realizados agrupados por obra social, 
nombre del plan y matricula  del médico. 
INPUT: nombre de la obra social, nombre del plan, matrícula del médico. 
(todos deben admitir valores nulos por defecto ) 
Proyectar la cantidad de estudios realizados. 
Si no se indica alguno de los parámetros se deben discriminar todas las ocurrencias.  */
-- :)

Create PROCEDURE pr_cant_estudiosXOS

    @nom_obrasocial varchar(50) = NULL,
    @nom_plan varchar(50) = NULL,
    @matricula_med int = NULL
AS

    if @nom_obrasocial is null -- Le asigno comodín
        SELECT @nom_obrasocial = '%'
    if @nom_plan is null --Le asigno comodín
        SELECT @nom_plan = '%'
    if @matricula_med is not NULL
        BEGIN --Proyección con condición de matrícula
	        SELECT os.Nombre, p.NombrePlan, r.Matricula, count(r.IdEstudio) EstudiosRealizados
	        FROM  ObraSocial os INNER JOIN Planes p ON os.Sigla= p.Sigla
	                         INNER JOIN Registros r ON r.Sigla= p.Sigla
                            INNER JOIN Afiliados a ON a.NroPlan= p.NroPlan and a.DNI = r.DNI
	        WHERE  os.Nombre LIKE @nom_obrasocial AND 
	                p.NombrePlan LIKE @nom_plan AND
	                r.Matricula=@matricula_med 
	        GROUP BY os.Nombre, p.NombrePlan, r.Matricula
        END
    ELSE
        BEGIN -- proyección para cualquier matrícula
	        SELECT os.Nombre, p.NombrePlan, r.Matricula, count(r.IdEstudio) EstudiosRealizados
	        FROM  ObraSocial os INNER JOIN Planes p ON os.Sigla= p.Sigla
	                         INNER JOIN Registros r ON r.Sigla= p.Sigla
                            INNER JOIN Afiliados a ON a.NroPlan= p.NroPlan and a.DNI = r.DNI
	        WHERE  os.Nombre LIKE @nom_obrasocial AND 
	                p.NombrePlan LIKE @nom_plan
	        GROUP BY os.Nombre, p.NombrePlan, r.Matricula
        END
