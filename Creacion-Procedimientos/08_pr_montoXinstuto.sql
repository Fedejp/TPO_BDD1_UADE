/*3.8)Crear un procedimiento que devuelva el precio total a liquidar a un determinado instituto. 
 INPUT: nombre del instituto, periodo a liquidar. 
 OUTPUT: precio neto. Devuelve el neto a liquidar al instituto para ese período en una variable.  */

 --:) 

Alter procedure pr_montoXinstuto
@NombreInstituto varchar(50),
@periodoInicial datetime,
@periodoFinal datetime
OUTPUT @NetoAPagar Money
AS
	Select @NetoAPagar = Sum(p.Precio-(p.precio*c.Cobertura/100)) 
	from ((((Registros r JOIN Institutos i on r.IdInstituto = i.IdInstituto)
            JOIN Afiliados a ON r.DNI = a.DNI AND r.Sigla=a.Sigla)
            JOIN Precios p ON p.IdEstudio=r.IdEstudio AND p.IdInstituto=r.IdInstituto)
            JOIN Coberturas c ON r.IdEstudio= c.IdEstudio AND r.Sigla=c.Sigla AND a.NroPlan=c.NroPlan)
	where @periodoInicial< r.Fecha AND r.Fecha<@periodoFinal AND @NombreInstituto = i.RazonSocial
GO
