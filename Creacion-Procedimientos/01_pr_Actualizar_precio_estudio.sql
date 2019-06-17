/*
3.1. Crear un procedimiento para ingresar el precio de un estudio.

INPUT: nombre del estudio, nombre del instituto y precio.

Si ya existe la tupla en Precios debe actualizarla.
Si no existe debe crearla.

Si no existen el estudio o el instituto debe crearlos.*/
 --:)
Create procedure pr_Actualizar_precio_estudio
@NombEstudio varchar(50),
@NombInsti varchar(50),
@precio money
As
	declare @idEstu int, @idInsti int
	Select @idInsti = idInstituto from Institutos
				where razonSocial = @NombInsti
	if (@idInsti is null)
		begin
			insert institutos values(@nombInsti,1)
			print 'Nuevo Instituto registrado'
			set @idInsti = (select max(idInstituto) from institutos)
		end
	Select @idEstu = IdEstudio from Estudios
				where Descripcion = @NombEstudio
	if (@idEstu is null)
		begin
			insert Estudios values(@NombEstudio)
			print 'Nuevo Estudio registrado'
			set @idEstu = (select max(idEstudio) from Estudios)
		end
	
	if exists (select * from precios where idEstudio = @idEstu and idInstituto = @idInsti)     
			update precios set precio = @precio where idEstudio = @idEstu and idInstituto = @idInsti
	else
			insert precios values (@idEstu, @idInsti, @precio)
	
	print 'Precio Registrado'














