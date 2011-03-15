class NinosController < ApplicationController
	def index
		@ninos = Nino.all
		respond_to do |format|
		        format.html
					  format.db  { send_data (system "mysqldump -u compartir -pdatos AsocCompartir_development") }
		end
	end

	def expediente
		@codigoExpediente = params[:id]
		p @codigoExpediente
		unless @codigoExpediente.blank?
		  @codigo = Nino.encontrarCodigoPorExpediente(@codigoExpediente)
		  @nino = Nino.find_by_codigo(@codigo)
		 	@edad = Nino.encontrarEdad(@codigo)
			@direccion = Nino.direccion(@codigo)
			@expediente = Expediente.find_by_codigo(@codigoExpediente)
		else
			@nino = nil
		end
	end
	def manual
	end

	def show
		codigo = params[:id]
		@nino = Nino.find_by_codigo(codigo)
		
	end

	def entrada
	end
	def buscar
	end


end
