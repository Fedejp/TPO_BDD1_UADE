--3.1 Pacientes con mayor cantidad de estudios realizados
-- :)
WITH pacientes_max_estudios(DNI, Apellido, Nombre, Cantidad) AS ( 
SELECT
r.DNI, p.Apellido, p.Nombre,
count (1) AS 'Cantidad'
FROM Registros r JOIN Pacientes p ON r.dni=p.DNI
GROUP BY
r.DNI, Apellido, Nombre
)
SELECT *
FROM pacientes_max_estudios
Where pacientes_max_estudios.Cantidad = (SELECT MAX (Cantidad) FROM pacientes_max_estudios)
GO

-- 3.2 Proyectar los estudios que se realizaron la mayor cantidad de veces. 
--:)
SELECT Registros.IdEstudio, Estudios.Descripcion, count(1) AS 'Cantidad' 
FROM Registros JOIN Estudios ON Registros.IdEstudio=Estudios.IdEstudio
GROUP BY Registros.IdEstudio,Estudios.Descripcion
HAVING count(*) = (SELECT MAX(t.Cantidad) 'CantTotal'
				FROM (SELECT Registros.IdEstudio, count(Registros.IdEstudio) 'Cantidad'
				FROM Registros
				GROUP by Registros.IdEstudio) t);
GO


--3.3. Proyectar la o las obras sociales m?s utilizadas. 
--:)
Select os.Nombre, count(r.Sigla) 'VecesUtilizada'
FROM ObraSocial os join Registros r ON os.Sigla=r.Sigla
group by os.Nombre
Having count(*) = (SELECT  max(VecesUtilizada) 'MaxVecesUtilizada'
					FROM (SELECT r.sigla, count(r.Sigla) 'VecesUtilizada' 
					FROM  Registros r 
					Group By r.sigla) resultado )
GO


--3.4. Proyectar el estudio de mayor precio, tener en cuenta el precio promedio del estudio por instituto.
-- !Ver si está bien.
Select EstMasCaro.IdEstudio, lista.Descripcion, EstMasCaro.PrecioEstudioMasCaro, EstMasCaro.PrecioPromedioEstudio
FROM ((Select pre.IdEstudio, avg(pre.precio)'PrecioPromedioEstudio',max(pre.precio)'PrecioEstudioMasCaro'
	From Precios pre
	Where pre.IdEstudio = (Select p.IdEstudio
						FROM Precios p 
						WHere p.Precio = (Select Max(pr.Precio) 'MaxPrecio'
										from Precios pr)
						group by p.IdEstudio)
	group by pre.IdEstudio) EstMasCaro
JOIN Estudios lista ON EstMasCaro.IdEstudio=lista.IdEstudio)
GO

--3.5. Proyectar el o los institutos que no realiz? estudios en el ?ltimo mes.
-- :)

SELECT  IdInstituto, RazonSocial As 'Instituto'
FROM Institutos
WHERE IdInstituto NOT IN (SELECT IdInstituto 
    					FROM Registros
    					WHERE datediff(mm, Registros.Fecha, getdate())<=1)
GO

--3.6. Proyectar la cantidad de los pacientes más viejos que no realizaron estudios en el último año.
--Consideramos "Pacientes Viejos" como los "pacientes con más de 70 años".
-- :)

WITH VisitasHaceMasDeUnAño
AS (SELECT DNI,Apellido,Nombre,Nacimiento
	FROM Pacientes P
	WHERE DNI NOT IN (SELECT DISTINCT DNI 
					FROM Registros r
					WHERE datediff(yy, r.Fecha,getdate()) <=1)
    )
SELECT DNI,Apellido,Nombre
FROM VisitasHaceMasDeUnAño v
where datediff(yy,v.Nacimiento,getdate())>=70
GO

--3.7 Especialidad con menos médicos

SELECT EspeMedi.IdEspecialidad, Especialidades.Descripcion, COUNT(EspeMedi.Matricula) AS 'CantMedicos'
FROM Especialidades JOIN EspeMedi ON EspeMedi.IdEspecialidad = Especialidades.IdEspecialidad
GROUP BY EspeMedi.IdEspecialidad, Especialidades.Descripcion 
HAVING count(*) = (SELECT MIN(e.Cantidad) 'MenosMedicos'
				FROM (SELECT EspeMedi.IdEspecialidad, count(EspeMedi.IdEspecialidad) 'Cantidad'
				FROM Especialidades
				GROUP by EspeMedi.IdEspecialidad) e);
GO

--3.8 Cantidad a liquidar por cobertura de estudios

SELECT 
	ObraSocial.Sigla, ObraSocial.Nombre, 
	SUM((Precios.Precio*Coberturas.Cobertura)/100) AS Monto

FROM 
(((((Registros JOIN ObraSocial ON Registros.Sigla=ObraSocial.Sigla) 
   JOIN Afiliados ON ObraSocial.Sigla = Afiliados.Sigla) 
   JOIN Planes ON Afiliados.NroPlan = Planes.NroPlan)
   JOIN Precios ON Precios.IdEstudio = Registros.IdEstudio 
			   AND Precios.IdInstituto=Registros.IdInstituto)
	JOIN Coberturas ON Coberturas.IdEstudio= Registros.IdEstudio 
					AND Coberturas.Sigla=Registros.Sigla) 
GROUP BY
	ObraSocial.Sigla, ObraSocial.Nombre

