require 'colorize'

class Vigenere
	
	attr_reader :alfabeto, :mensaje
	
	def initialize
		@alfabeto=('A'..'Z').to_a
		@mensaje=""
	end
	
	def mensaje=(m)
		@mensaje=m.delete(' ')
	end
	
end