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
    
    def cifrado
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                @div_mensaje[i][j]=@alfabeto.index("#{@div_mensaje[i][j]}")
            end
		end
        
        for i in (0..@clave.length-1) 
            @clave[i]=@alfabeto.index("#{@clave[i]}")
        end
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                index=(@div_mensaje[i][j]+@clave[j])%@alfabeto.length
                @div_mensaje[i][j]=@alfabeto[index]
            end
		end
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                print "#{@div_mensaje[i][j]}".green
            end
            print " "
		end
        puts
    end
    
    def descifrado
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                @div_mensaje[i][j]=@alfabeto.index("#{@div_mensaje[i][j]}")
            end
		end
        
        for i in (0..@clave.length-1) 
            @clave[i]=@alfabeto.index("#{@clave[i]}")
        end
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                index=(@div_mensaje[i][j]-@clave[j])%@alfabeto.length
                @div_mensaje[i][j]=@alfabeto[index]
            end
		end
        
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                print "#{@div_mensaje[i][j]}".green
            end
            print " "
		end
        puts
    end
    
    def resultado
        for i in (0..@div_mensaje.length-1)
            for j in (0..@div_mensaje[i].length-1)
                print "#{@div_mensaje[i][j]}"
            end
		end
        puts
    end
	
end

@test=Vigenere.new

loop do
	puts "PRACTICA: CIFRADO DE VIGENERE"
	puts "1: Cifrar"
	puts "2: Descifrar"
	puts "3: Salir"
	print 'Introduzca una opcion: '
	opcion = gets.chomp
	case opcion
		when '1'
            system "clear"
			print "Introduzca el mensaje: "
            mensaje=gets.chomp
            @test.mensaje=mensaje
            print "Introduzca la palabra clave: "
            clave=gets.chomp
            @test.clave=clave
            @test.div_mensaje
            @test.cifrado
            print "Mensaje cifrado: "
            @test.resultado
		when '2'
			system "clear"
			print "Introduzca el mensaje: "
            mensaje=gets.chomp
            @test.mensaje=mensaje
            print "Introduzca la palabra clave: "
            clave=gets.chomp
            @test.clave=clave
            @test.div_mensaje
            @test.descifrado
            print "Mensaje descifrado: "
            @test.resultado
		when '3'
			system "clear"
			break
	end
end