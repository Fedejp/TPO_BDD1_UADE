/*3.3. Crear un procedimiento para que proyecte los estudios realizados en un determinado mes.

INPUT: mes y año.
Proyectar los datos del afiliado y los de los estudios realizados.*/
--Funciona, pero no retorna todos los que tiene que retornar. Creo que lo limita el Join pq no todos los que están registrados aparecen en la tabla de afiliados.
--Eso se soluciona cargando datos como corresponde.
create procedure pr_estudios_x_mes
@mes int,
@ano int
AS
	select r.Fecha, p.DNI, p.Nombre, p.Apellido, e.IdEstudio, e.Descripcion as Estudio, r.Sigla as ObraSocial, a.IdAfiliado as NroAfiliado, pl.NombrePLan
	from ((((registros r JOIN pacientes p on r.DNI=p.DNI)
			JOIN estudios e ON r.IdEstudio = e.IdEstudio)
			JOIN Afiliados a ON r.DNI=a.DNI and a.Sigla=r.Sigla)
			JOIN Planes pl on pl.NroPlan=a.NroPlan and pl.Sigla=r.Sigla)
	where datepart(mm, r.Fecha) = @mes and datepart(yy,r.Fecha) = @ano



