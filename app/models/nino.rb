class Nino < ActiveRecord::Base
	validates_uniqueness_of :codigo
	validates_presence_of :codigo

	def self.buscar_por_parametros(params)
			consulta = "SELECT ninos.codigo, ninos.nombre, ninos.apellido,ninos.estadoPadrinazgo,(YEAR(CURDATE())-YEAR(ninos.fechaNac))-(RIGHT(CURDATE(),5)<RIGHT(ninos.fechaNac,5)) AS edad,ninos.sexo,ninos.habitaCon,ninos.nombreCentro,ninos.nombreSector,ninos.codigoEducador, MAX(situacion_academicas.grado) FROM (ninos INNER JOIN educadors ON ninos.codigoEducador = educadors.codigo) left outer join situacion_academicas on ninos.codigo = situacion_academicas.codigoNino "
			edad = " (YEAR(CURDATE())-YEAR(ninos.fechaNac))-(RIGHT(CURDATE(),5)<RIGHT(ninos.fechaNac,5)) "
			condiciones = "WHERE "
			
			tiposPadrinazgo = {"ingresar"=>"Por ingresar","compartir"=>"Padrinazgo Compartir","partage"=>"Padrinazgo Partage","otros"=>"Otro Padrinazgo","interrupcion"=>"En interrupción","propuestos"=>"Propuesto para Egreso","egresados"=> "Egresado"}


												

			if not params[:desdeEdad].blank? and not params[:hastaEdad].blank? then
					condiciones += "(#{edad} >= #{params[:desdeEdad].to_i} AND #{edad} <= #{params[:hastaEdad].to_i}) "
			elsif params[:desdeEdad].blank? and not params[:hastaEdad].blank? then
				  condiciones += "(#{edad} <= #{params[:hastaEdad].to_i}) "
			elsif not params[:desdeEdad].blank? and params[:hastaEdad].blank? then
					condiciones += "(#{edad} >= #{params[:desdeEdad].to_i}) "
			end

			 
  		unless params[:sexo].blank?
						unless condiciones.eql? "WHERE "
							condiciones += " AND (ninos.sexo = '#{params[:sexo]}' ) "
						else
							condiciones += " (ninos.sexo = '#{params[:sexo]}') "
						end
			end

			unless params[:centro].blank?
						unless condiciones.eql? "WHERE "
						   condiciones += "AND ( "
						else
							 condiciones += "( "
					  end
							 (params[:centro].length - 1).times do |j|
								 cys = params[:centro][j].split("_")
								 hasta = cys.length - 2
								 centro = ""
								 hasta.times do |i|
										centro += cys[i] + " "
								 	end
								 
								 sector = cys[-2] + " " + cys[-1]
								 condiciones += " (ninos.nombreCentro = '#{centro}' AND ninos.nombreSector = '#{sector}') OR "
								 
							end

							cys = params[:centro][-1].split("_") 
							hasta = cys.length -  2
							centro = ""
							hasta.times do |i|
								centro += cys[i] + " "
							end

							sector = cys[-2] + " " + cys[-1]
							condiciones += ("ninos.nombreCentro = '#{centro}' AND ninos.nombreSector = '#{sector}'")
							condiciones += ") "
						
			end

			unless params[:padrinazgo].blank?
					unless condiciones.eql? "WHERE "
							condiciones += " AND (ninos.estadoPadrinazgo = '#{tiposPadrinazgo[params[:padrinazgo]]}' ) "
						else
							condiciones += " (ninos.estadoPadrinazgo = '#{tiposPadrinazgo[params[:padrinazgo]]}') "
						end
 					tiposPadrinazgo[params[:padrinazgo]]
			end


			unless params[:educ].blank?
						unless params[:educ][0] == "todo" then
							
						
						unless condiciones.eql? "WHERE "
						   condiciones += "AND ( "
						else
							 condiciones += "( "
					  end
							 (params[:educ].length - 1).times do |j|
								 educador = params[:educ][j]
								 condiciones += " (ninos.codigoEducador = '#{educador}') OR "
								 
							end

							educador = params[:educ][-1] 
							condiciones += ("ninos.codigoEducador = '#{educador}'")
							condiciones += ") "
						end
			end


		
			if condiciones.eql? "WHERE "
					condiciones = ""
			end
			consulta += condiciones
			consulta += " GROUP BY ninos.codigo"

		 s = ActiveRecord::Base.connection.execute(consulta)
		 filas = []
		 s.each do |row|
			 filas << row
		 filas
		end
	end

	def self.buscar_por_maestros(educadores)
			filas = []
			educadores.each do |codigo|
			s = ActiveRecord::Base.connection.execute("SELECT ninos.codigo, ninos.nombre, ninos.apellido FROM ninos INNER JOIN educadors ON ninos.codigoEducador = educadors.codigo WHERE educadors.codigo='#{codigo}'")
			s.each do |row|
			   filas << row
				end
			end
			filas
	end

	def self.buscar_familiares(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT familiars.nombre,familiars.apellido FROM (ninos INNER JOIN esfamiliars ON ninos.codigo = esfamiliars.codigoNino) INNER JOIN familiars ON esfamiliars.nombreFamiliar = familiars.nombre AND esfamiliars.apellidoFamiliar = familiars.apellido WHERE ninos.codigo='#{codigo}'")
	s.each do |row|
			filas << row		
		end
		filas
	end


	def self.tabSeparated(arreglo)
	cadena = " "
	arreglo.each do |linea|
		linea.each do |celda|
			cadena += "#{celda}\t"
		end
		cadena += "\n"
	end
	cadena
	end
end
