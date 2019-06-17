--Regla sigla
ALTER TABLE ObraSocial
	add constraint regla_sigla CHECK(Sigla like '[A-Z][A-Z]')

--Regla dni
--DNI est� definido como INT, va a ser siempre Num�rico

--Regla Categoria
ALTER TABLE ObraSocial
    ADD CONSTRAINT regla_ObraSocial_categoria CHECK (Categoria IN ('os', 'pp'));

--Regla sexo
ALTER TABLE Pacientes
    ADD CONSTRAINT regla_Pacientes_sexo CHECK (Sexo IN ('f','m'));
ALTER TABLE Medicos
    ADD CONSTRAINT regla_Medicos_sexo CHECK (Sexo IN ('f','m'));


--Regla fecha de estudio
ALTER TABLE Registros
	add constraint regla_Registros_fechaEstudio CHECK ( abs(datediff(mm,Fecha,getdate()))<1)

--Regla fecha de nacimiento(es el unico que no se si esta bien)
ALTER TABLE Pacientes 
 ADD CONSTRAINT regla_Pacientes_Nacimiento CHECK( 21<datediff(yy,nacimiento, getdate()) AND datediff(yy,nacimiento, getdate())<80);                                                              

--Regla NroPlan
ALTER TABLE Planes
    ADD CONSTRAINT check_Plan_NroPlan CHECK (NroPlan <= 12);
     
--Regla Precio
ALTER TABLE Precios
    ADD CONSTRAINT check_Precios_Precio CHECK (Precio >= $0 AND Precio <= $8000);

--Regla CObertura
ALTER TABLE Coberturas  
	ADD CONSTRAINT  check_Coberturas_porcentaje CHECK(0<=cobertura  AND cobertura<=100);                                                              
                                                              
--Regla estado
--Es un Bit, no s� si hace falta agregarlo
ALTER TABLE Medicos
    ADD CONSTRAINT check_Medicos_Activo CHECK (Activo IN (1,0));
