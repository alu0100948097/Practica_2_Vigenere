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
        temp=[]
        
        for i in (0..@div_mensaje.length-1)
            temp.push(@div_mensaje[i].to_s.split(''))
		end
        
        @div_mensaje=temp
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                print "#{@div_mensaje[i][j]}".blue
            end
            print " "
		end
        
        puts
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                print "#{@clave[j]}".red
            end
            print " "
		end
        
        puts
        
	end
	
end