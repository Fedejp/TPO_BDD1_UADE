INSERT INTO Especialidades (Descripcion) VALUES ('Oncologia');
INSERT INTO Especialidades (Descripcion) VALUES ('Nutricion');
INSERT INTO Especialidades (Descripcion) VALUES ('Psiquiatria');
INSERT INTO Especialidades (Descripcion) VALUES ('Oftalmologia');
INSERT INTO Especialidades (Descripcion) VALUES ('Cirugia');
INSERT INTO Especialidades (Descripcion) VALUES ('Terapia intensiva');

INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (000011,'Lopez','Anibal','m','1/3/1980',1);
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (044025,'Castillo','Daniela','f','7/6/1979',1);
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (485920,'Pepe','Santiago','m','1/2/1929',0);
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (075001,'Kilmer','Paulina','f','8/22/1989',1);
INSERT INTO Medicos (Matricula, Apellido, Nombre, Sexo, Nacimiento, Activo) VALUES (000781,'Ramirez','Julia','f','1/2/1942',0);

INSERT INTO Estudios (Descripcion) VALUES ('EcoDoppler cardiaco.');
INSERT INTO Estudios (Descripcion) VALUES ('Ergometria.');
INSERT INTO Estudios (Descripcion) VALUES ('Antropometria.');
INSERT INTO Estudios (Descripcion) VALUES ('Tomografia craneal');
INSERT INTO Estudios (Descripcion) VALUES ('Ecografia abdominal');
INSERT INTO Estudios (Descripcion) VALUES ('Analisis de Sangre completo');
INSERT INTO Estudios (Descripcion) VALUES ('Transfusion de plaquetas.');
INSERT INTO Estudios (Descripcion) VALUES ('Consulta.');

INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Clinica Moguillansky',1);
INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Hospital Aleman',1);
INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Clinica Santa Catalina',0);
INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Hospital Britanico',1);
INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Sanatorio Rio Cuarto',0);
INSERT INTO Institutos (RazonSocial, Vigente) VALUES ('Hospital Italiano',1);

INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('OC','OSECAC','os');
INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('IN','Instituto','os');
INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('GA','Galeno','pp');
INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('OM','Omint','pp');
INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('SW','Swiss Medical','pp');
INSERT INTO ObraSocial (Sigla, Nombre, Categoria) VALUES ('UB','Obra Social de la UBA','os');


INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (15151515,'Lopez','Agustin', 'm','1/2/1989','+54355406879');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (12347778,'Augusto','Ailen', 'f','1/7/1995','+54528606829');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (40415868,'Pavloski','Boris', 'm','1/9/1979','+54354406879');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (12878798,'Carolio','Carolina', 'f','12/7/1949','+54344875379');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (12751498,'Maggi','Sulivan', 'm','12/2/1987','+5435498879');
INSERT INTO Pacientes (DNI, Apellido, Nombre, Sexo, Nacimiento, Telefono) VALUES (75345698,'Grande','Ariana', 'f','1/8/1979','+5435806639');

INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (6,000011)
INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (1,044025)
INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (2,485920)
INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (3,075001)
INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (6,000781)
INSERT INTO EspeMedi (IdEspecialidad, Matricula) VALUES (5,000781)

INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (1,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (1,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (2,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (10,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (11,10)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (5,8)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (5,5)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (5,6)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (6,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (6,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (7,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (7,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (8,7)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (7,7)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (6,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (7,5)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (8,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (8,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (8,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (9,1)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (9,2)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (10,9)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (10,8)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (10,5)
INSERT INTO EstuEspe (IdEstudio, IdEspecialidad) VALUES (10,6)

INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OS', '310') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OS', '210')
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OS', '410')
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OC', 'Empleados') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OC', 'Gerenciales') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('IN', 'Basico') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('IN', 'Jerarquicos') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('GA', 'Bronce') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('GA', 'Plata') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('GA', 'Oro') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OM', 'Vos') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('OM', 'AltoPlan') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('SW', 'Suizo')  
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('SW', 'Suizo Premium') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('SW', 'Suizo VIP') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('UB', 'Academicos') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('UB', 'Decanato') 
INSERT INTO Planes (Sigla,NombrePlan) VALUES ('UB', 'Anexos') 

INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (1,2,50)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (1,5,70)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (2,8,90)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (10,1,80)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (11,1,800)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (7,1,250)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (6,1,150)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,1,450)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (8,2,200)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,2,300)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (1,6,450)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (10,6,100)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,6,800)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (8,5,500)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (2,5,920)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (11,5,820)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,5,500)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (10,10,800)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (5,10,250)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (6,10,150)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,10,450)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (7,8,200)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (8,8,250)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,8,300)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (7,7,200)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (8,7,250)
INSERT INTO Precios (IdEstudio,IdInstituto,Precio) VALUES (9,7,300)

--En la tabla coberturas falta el campo "coberturas", lo cuento como un INTEGER con valores del 0 al 100, representando porcentaje
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (9,'GA',8,80)
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (5,'GA',9,100)
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (1,'GA',10,40)
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (2,'OC',4,75)
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (10,'OM',11,35)
INSERT INTO Coberturas(IdEstudio,Sigla,NroPlan,Cobertura) VALUES (9,'OC',4,10)


INSERT INTO Afiliados(IdAfiliado,DNI,Sigla,NroPlan) VALUES (25300325, 15151515,'GA',8)
INSERT INTO Afiliados(IdAfiliado,DNI,Sigla,NroPlan) VALUES (35300404, 40415868,'GA',10)
INSERT INTO Afiliados(IdAfiliado,DNI,Sigla,NroPlan) VALUES (64000010, 12347778,'OC',4)

--Tabla Registros-- 
--Habría que hacer un registro para cada paciente para que sea logica su presencia en el sistema, pero no es fundamental
 INSERT INTO Registros (Fecha, DNI, IdEstudio,IdInstituto, Matricula, Sigla) VALUES ('06/12/2019', 15151515,9,1,000011,'GA')
 INSERT INTO Registros (Fecha, DNI, IdEstudio,IdInstituto, Matricula, Sigla) VALUES ('06/10/2019', 12347778,9,2,044025,'OC')
 INSERT INTO Registros (Fecha, DNI, IdEstudio,IdInstituto, Matricula, Sigla) VALUES ('6/05/2019', 40415868,1,2,781,'GA')