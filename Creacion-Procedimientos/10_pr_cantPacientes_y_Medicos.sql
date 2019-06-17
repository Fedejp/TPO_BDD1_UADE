/*3.10)  Crear un procedimiento que devuelva la cantidad de pacientes y m�dicos que efectuaron estudios en un determinado per�odo. 
INPUT / OUTPUT: dos enteros. Ingresar per�odo a consultar (mes y a�o ) 
Retornar cantidad de pacientes que se realizaron uno o m�s estudios y cantidad de m�dicos solicitantes de los mismos, en dos variables
*/
--
-- Ver c�mo devolver en variables
Create PROCEDURE pr_cantPacientes_y_Medicos
@mes int,
@a�o int 

AS
  declare @cantMedicos int, @cantPacientes int
	SELECT COUNT(DISTINCT Matricula) CantMedicos, COUNT(DISTINCT DNI) CantPacientes
	FROM  Registros r
	WHERE	((datepart(mm,r.Fecha)=@mes) AND 
		  datepart(yy, r.Fecha)=@a�o)