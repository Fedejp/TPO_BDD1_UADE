/*3.2. Crear un procedimiento para ingresar datos del afiliado.

INPUT: dni del paciente, sigla de la obra social, nro del plan, nro de afiliado.

Si ya existe la tupla en Afiliados debe actualizar el nro de plan y el nro de afiliado.

Si no existe debe crearla.*/

--:)
create procedure pr_act_afiliado
@dni int,
@sigla char(2),
@plan int,
@nafiliado int
AS
	if exists (select idafiliado from afiliados where dni = @dni and sigla = @sigla )
				begin
					UPDATE Afiliados set IdAfiliado = @nafiliado, NroPlan = @plan where dni = @dni and sigla = @sigla
					print 'Se actualizo un afiliado'
				end
	else			
				begin
					insert Afiliados values (@nafiliado, @dni, @sigla, @plan)
				
					print 'Se agrego un nuevo afiliado'
				end
