/* Crear un procedimiento que devuelva el monto a abonar de un paciente moroso.
 INPUT: dni del paciente, estudio realizado, fecha de realización, punitorio (mensual).
OUTPUT: precio neto. Obtener punitorio diario y precio a abonar.
Devuelve precio + punitorio en una variable.  */

--Realiza un punitorio MENSUAL, según se ingrese el porcentaje, sobre el precio total del estudio. Se lo suma al precio del estudio cubierto, si tuviese cobertura
-- :) funciona pero no tengo registros de hace más de un mes. Verificar output.
Create PROCEDURE pr_montoApagar
    @dniPaciente varchar(50),
    @estudioRealizado varchar(50),
    @fecha datetime,
    @PorcentajePunitorio INt

AS      
	SELECT  p.Precio-((c.Cobertura* Precio)/100)+((p.precio*@PorcentajePunitorio/100)*datediff(mm, @fecha, getdate())) APagar
	FROM Registros r INNER JOIN Precios p ON r.IdEstudio= p.IdEstudio and p.IdInstituto=r.IdInstituto
                    INNER JOIN Afiliados a ON r.DNI= a.DNI and r.Sigla=a.Sigla
                    INNER JOIN Coberturas c ON r.Sigla = c.Sigla and a.NroPlan = c.nroPlan
					INNER JOIN Estudios e on e.IdEstudio=r.IdEstudio
        WHERE  r.Fecha= @fecha AND
	            e.Descripcion=@estudioRealizado AND
                r.DNI=@dniPaciente
