#~ Trabajo realizado por Sergio Martín santana (alu0100611625)
#~ 18/10/2013
#~ Lenguajes y Paradigmas de la Programación

require "./gcd"

class Racional
attr_reader :x,:y

# Metodo Inicializar

	def initialize (x, y)
		aux = gcd(x, y)
		@x,@y = x/aux, y/aux
	end

# Minimo común multiplo
	def Racional.mcm(x,y)
		(x.to_i*y.to_i)/gcd(x.to_i,y.to_i)
	end

# to_s # devuelve una cadena con la representación del racional
   	def to_s
		"(#{@x}/#{@y})"
	end
#suma # devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
	def +(other)
		den = (@y * other.y)
		num = (@x*other.y)+(other.x*@y)
		Racional.new(num,den)
	end
		
#resta # devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parámetro
	def -(other)
		den = (@y * other.y)
		num = (@x*other.y)-(other.x*@y)
		Racional.new(num,den)
	end
#producto # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro

	def *(other)
		den = (@y*other.y)
		num = (@x*other.x)
		Racional.new(num,den)
	end
#division # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
	def /(other)
		den = (@y*other.x)
		num = (@x*other.y)
		Racional.new(num,den)
		
	end

end

#P1= Racional.new(12,9)
#P2= Racional.new(8,18)
#P3= Racional.new(8,16)


#puts " Salidas Programa "

#P4 = P2 + P1
#puts P4
#P5 = P2 - P1
#puts P5
#P6 = P2 * P1
#puts P6
#P7 = P2 / P1
#puts P7 

