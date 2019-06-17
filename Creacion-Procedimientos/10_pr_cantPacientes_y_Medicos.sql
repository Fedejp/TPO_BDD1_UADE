/*3.10)  Crear un procedimiento que devuelva la cantidad de pacientes y médicos que efectuaron estudios en un determinado período. 
INPUT / OUTPUT: dos enteros. Ingresar período a consultar (mes y año ) 
Retornar cantidad de pacientes que se realizaron uno o más estudios y cantidad de médicos solicitantes de los mismos, en dos variables
*/
--
-- Ver cómo devolver en variables
Create PROCEDURE pr_cantPacientes_y_Medicos
@mes int,
@año int 

AS
  declare @cantMedicos int, @cantPacientes int
	SELECT COUNT(DISTINCT Matricula) CantMedicos, COUNT(DISTINCT DNI) CantPacientes
	FROM  Registros r
	WHERE	((datepart(mm,r.Fecha)=@mes) AND 
		  datepart(yy, r.Fecha)=@año)