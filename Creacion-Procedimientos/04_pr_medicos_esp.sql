/*3.4. Crear un procedimiento que proyecte los datos de los médicos para una determinada especialidad.

INPUT: nombre de la especialidad y sexo (default null).

Proyectar los datos de los médicos activos que cumplan con la condición.
 Si no se especifica sexo, listar ambos.*/
--:) 

Create procedure pr_medicos_esp
@especialidad varchar (50),
@sexo char = NULL
AS
	if @sexo is null
		BEGIN
            select a.Descripcion, c.Apellido, c.Nombre, c.Sexo 
	        from ((especialidades as a join espemedi as b on a.idespecialidad = b.idespecialidad)
		        join medicos as c on b.matricula = c.matricula)
		    where a.descripcion = @especialidad and c.Activo=1
        END
	ELSE
        BEGIN
            select a.Descripcion, c.Apellido, c.Nombre, c.Sexo 
	        from ((especialidades as a join espemedi as b on a.idespecialidad = b.idespecialidad)
	    	    join medicos as c on b.matricula = c.matricula)
		    where a.descripcion = @especialidad and c.sexo = @sexo and c.Activo=1
        END


