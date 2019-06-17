/* 3.7 Crear un procedimiento que proyecte dni, fecha de nacimiento,
 nombre y apellido de los pacientes que correspondan a los n (valor 
 solicitado) pacientes más viejos cuyo apellido cumpla con 
 determinado patrón de caracteres. 
 INPUT: cantidad (valor n),
  patrón caracteres (default null). 
  Proyectar los pacientes que cumplan con la condición. 
  (Ejemplo: los 10 pacientes más viejos cuyo apellido 
 finalice con ‘ez’ o los 8 que comiencen con la letra ‘A’  */

 CREATE PROCEDURE pr_n_pacientes_viejos 
 @cant INT, 
 @patronap VARCHAR(50) = null
 AS
 IF @patronap is null
    BEGIN
        select @patronap='%'
    END
 SELECT TOP @cant Pacientes.DNI, Pacientes.FechaNac, Pacientes.Nombre, Pacientes.Apellido
    FROM Pacientes 
    WHERE pacientes.apellido LIKE @patronap
    order by pacientes.FechaNac ASC