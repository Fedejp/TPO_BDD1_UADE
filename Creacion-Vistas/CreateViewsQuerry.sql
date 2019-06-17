--1 :)
CREATE VIEW vw_coberturas as
SELECT ObraSocial.Sigla, ObraSocial.Nombre, Planes.NroPlan, Planes.NombrePlan, Estudios.IdEstudio, Estudios.Descripcion, Coberturas.Cobertura as PorcentajeCobertura
FROM (((ObraSocial JOIN Planes ON ObraSocial.Sigla=Planes.Sigla) 
JOIN Coberturas ON Planes.Sigla=Coberturas.Sigla AND Planes.NroPlan=Coberturas.NroPlan) 
JOIN Estudios ON Estudios.IdEstudio=Coberturas.IdEstudio)
GO

--2 :)
CREATE VIEW vw_medicos_activos AS
SELECT Medicos.Matricula, Medicos.Nombre, Medicos.Apellido, Medicos.Sexo 
FROM Medicos WHERE Medicos.Activo=1
GO
--3 :) 
CREATE VIEW vw_pacientes AS 
SELECT Pacientes.DNI, Pacientes.Nombre AS nombrePaciente, Pacientes.Apellido, Pacientes.Sexo, Pacientes.Nacimiento, ObraSocial.Nombre AS nombreObraSocial, Afiliados.NroPlan,Afiliados.IdAfiliado
FROM ((Pacientes JOIN Afiliados ON Pacientes.DNI=Afiliados.DNI) JOIN ObraSocial ON ObraSocial.Sigla=Afiliados.Sigla)
GO

--4 :)
CREATE VIEW vw_pacientes_sin_cobertura AS
SELECT Pacientes.DNI, Pacientes.Nombre, Pacientes.Apellido, Pacientes.Sexo, Pacientes.Nacimiento
FROM Pacientes LEFT OUTER JOIN Afiliados ON Pacientes.DNI = Afiliados.DNI
GO

--5 :)
CREATE VIEW vw_total_medicos_sin_especialidades (Sexo, Cantidad) AS
SELECT Medicos.Sexo, Count(Medicos.Matricula)
FROM Medicos LEFT OUTER JOIN EspeMedi ON Medicos.Matricula=EspeMedi.Matricula
GROUP BY Medicos.Sexo
GO

--6 >:D
CREATE VIEW vw_afiliados_con_una_cobertura AS
SELECT Pacientes.DNI, Pacientes.Nombre, Pacientes.Apellido FROM Pacientes INNER JOIN Afiliados ON Pacientes.DNI=Afiliados.DNI
GROUP BY Pacientes.DNI, Pacientes.Nombre, Pacientes.Apellido
HAVING COUNT(Afiliados.DNI) = 1
GO

--7 :)
CREATE VIEW vw_cantidad_estudios_por_medico AS
SELECT Medicos.Matricula, Medicos.Nombre, Medicos.Apellido, Count (Registros.Matricula) AS CantEstudios
FROM Medicos JOIN Registros ON Medicos.Matricula = Registros.Matricula
GROUP BY Medicos.Matricula, Medicos.Nombre, Medicos.Apellido
GO

--8 
CREATE VIEW vw_registros_de_estudios AS
SELECT Pacientes.DNI, Pacientes.Nombre, Pacientes.Apellido, Registros.IdEstudio, Estudios.Descripcion AS DescEstudio, Institutos.RazonSocial AS Instituto, Medicos.Matricula AS MatriculaSolicitante, Medicos.Apellido AS ApellidoSolicitante, Registros.Fecha AS FechaRealizado, ObraSocial.Nombre AS ObraSocial
FROM (((((Pacientes JOIN Registros ON Pacientes.DNI = Registros.DNI) 
JOIN Medicos ON Registros.Matricula=Medicos.Matricula) 
JOIN Institutos ON Institutos.IdInstituto = Registros.IdInstituto) 
JOIN Estudios ON Registros.IdEstudio=Estudios.IdEstudio) 
JOIN ObraSocial ON Registros.Sigla=ObraSocial.Sigla)
GO

--9 :)
--Drop view vw_estudios_sin_cobertura
CREATE VIEW vw_estudios_sin_cobertura AS
select Estudios.IdEstudio, Estudios.Descripcion
from Estudios 
WHERE Estudios.IdEstudio NOT IN ( SELECT Coberturas.IdEstudio FROM Coberturas)
GO

--10 MODIFICAR SI SE MODIFICA EL NÚMERO DE PLAN
--Drop view vw_planes_sin_cobertura
CREATE VIEW  vw_planes_sin_cobertura AS
SELECT planes.NroPlan, Planes.Sigla, Planes.NombrePlan
FROM Planes 
WHERE Planes.NroPlan NOT IN (SELECT Coberturas.NroPlan FROM Coberturas) --Cómo chequearlo cuando hay más de un campo?
GO

--11 Chequear cálculo de monto cubierto según cómo se almacene la Cobertura
-- También verificar si el número de plan modifica algo (Creo que no)
CREATE VIEW vw_tabla_de_precios AS
SELECT Estudios.Descripcion, ObraSocial.Nombre AS NombObraSocial, Planes.NombrePlan, Institutos.RazonSocial AS Instituto, Precios.Precio AS PrecioEstudio, Coberturas.Cobertura AS PorcentajeCubierto,  (Precios.Precio-(Coberturas.Cobertura*Precios.Precio)/100) AS PrecioFinal
FROM (((((Estudios JOIN Coberturas ON Estudios.IdEstudio = Coberturas.IdEstudio) 
JOIN ObraSocial ON Coberturas.Sigla=ObraSocial.Sigla)
JOIN Planes ON Planes.NroPlan = Coberturas.NroPlan)
JOIN Precios ON Precios.IdEstudio = Estudios.IdEstudio)
JOIN Institutos ON Precios.IdInstituto = Institutos.IdInstituto)
GO 

--12 :)
CREATE VIEW vw_estudios_a_prepagas AS 
SELECT Registros.IdEstudio, Estudios.Descripcion AS NombreEstudio, ObraSocial.Nombre AS Prepaga
FROM ((Registros JOIN Estudios ON Registros.IdEstudio = Estudios.IdEstudio)
JOIN ObraSocial ON Registros.Sigla=ObraSocial.Sigla)
WHERE ObraSocial.Categoria = 'pp' AND abs(DateDiff(dd, Registros.Fecha,getDate())) <=45
GO

--13 
--Drop view vw_estudios_por_mes
CREATE VIEW vw_estudios_por_mes AS
SELECT DATENAME(M, Registros.Fecha) AS Mes, Pacientes.sexo, Estudios.IdEstudio, Count(Registros.DNI) AS CantRealizados
FROM ((Pacientes JOIN Registros ON Pacientes.DNI = Registros.DNI) 
JOIN Estudios ON Estudios.IdEstudio = Registros.IdEstudio)
WHERE DateDiff(mm, Registros.Fecha, getDate()) <1
GROUP BY DATENAME(mm, Registros.Fecha), Pacientes.Sexo, Estudios.IdEstudio 
GO

--14 No sé cómo indicar a qué semana pertenece, si a la primera o a la segunda.
CREATE VIEW  vw_estudios_por_instituto AS
SELECT Registros.IdInstituto, Institutos.RazonSocial AS Instituto, Count(Registros.IdInstituto) AS CantEstudios
FROM Registros JOIN Institutos ON Registros.IdInstituto = Institutos.IdInstituto
WHERE DateDiff(mm,Registros.Fecha, getDate())<14
GROUP BY Registros.IdInstituto, Institutos.RazonSocial, datepart(wk, registros.Fecha)