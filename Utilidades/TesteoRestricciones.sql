--NINGUNO DE ESTOS VALORES DEBERÍA PODER INSERTARSE EN LAS TABLAS.
--ES PARA COMPROBAR LAS RESTRICCIONES

--1 -Solo caracteres alfabeticos en la sigla
INSERT INTO ObraSOcial (Sigla, Nombre, Categoria) VALUES ('L2','La Segunda','pp');

--2 Solo Caracteres numéricos en DNI
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES ('40-994-839','Parodi','Federico', 'm','1/2/1996','+5435455879');

--3 Solo 'os' o 'pp' como categoría en la obra social
INSERT INTO ObraSOcial (Sigla, Nombre, Categoria) VALUES ('LS','La Segunda','as');

--4 Fecha del estudio hasta un mes anterior a la fecha
INSERT INTO Registros (Fecha, DNI, IdEstudio,IdInstituto, Matricula, Sigla) VALUES ('12/05/2009', 15151515,9,1,000011,'OS');

--5 Fecha de nacimiento >21, <80 años
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES ('40994839','Parodi','Federico', 'm','1/2/2002','+543854259');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES ('40994839','Parodi','Federico', 'm','1/2/1800','+543549999');

--6 Numero de Plan positivo y menor que 12
--Chequear Mail

--7 Precio positivo y menor a 8000
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (5,2,8200);
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (3,5,-500);

--8 Cobertura debe representar un porcentaje
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (9,'GA',11,250);
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (9,'GA',11,-80);

--9 Estado Activo Debe ser V O F
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (551515,'Carancho','Pablo','m','1/3/1980','Activo');
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (551515,'Carancho','Pablo','m','1/3/1980','Verdadero');
