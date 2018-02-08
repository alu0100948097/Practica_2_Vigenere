require 'colorize'

class Vigenere
	
	attr_reader :alfabeto, :mensaje, :clave
	
	def initialize
		@alfabeto=('A'..'Z').to_a
		@mensaje=""
		@clave=[]
	end
	
	def mensaje=(m)
		@mensaje=m.delete(' ').split('')
	end
	
	def clave=(c)
		@clave=c.delete(' ').split('')
	end
	
end