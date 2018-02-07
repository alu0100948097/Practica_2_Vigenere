require 'colorize'

class Vigenere
	
	attr_reader :alfabeto
	
	def initialize
		@alfabeto=('A'..'Z').to_a
	end
	
end