require 'colorize'

class Vigenere
	
	attr_reader :alfabeto, :mensaje, :clave, :div_mensaje
	
	def initialize
		@alfabeto=('A'..'Z').to_a
		@mensaje=""
		@clave=[]
		@div_mensaje=[]
	end
	
	def mensaje=(m)
		@mensaje=m.delete(' ')
	end
	
	def clave=(c)
		@clave=c.delete(' ').split('')
	end
	
	def div_mensaje
		@div_mensaje=@mensaje.scan(/.{1,#{@clave.length}}/)
	end
	
end