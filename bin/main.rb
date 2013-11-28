require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Sparse.rb"
require "./lib/PRC_GEM/matriz.rb"
require "./lib/PRC_GEM/Densa.rb"

M1 = Densa.new(3,3)
M2 = Sparse.new(3,3)
M11 = Sparse.new(3,3)

M3 = Densa.new(3,3)
M4 = Sparse.new(3,3)



M1.fill_M([[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)],[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)],[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)]])
M2.fill_M([[0,0],[1,1],[2,2]],[1,2,3])
M11.fill_M([[0,0]],[Racional.new(1,2)])

M3.fill_M([[1,1,1],[1,1,1],[1,1,1]])
M4.fill_M([[0,0],[1,1],[2,2]],[1,2,3])

Mp = Densa.new(3,3)
Mp.fill_M([[Racional.new(3,2),1,1],[1,1,1],[1,1,1]])

#M5 = M11 + M3
M6 = M3 + M11

M6.to_s

MA = Sparse.new(2,2)
MB = Sparse.new(2,2)
MT = Sparse.new(2,2)

MA.fill_M([[1,1]],[2])
MB.fill_M([[1,1]],[2])

MA.to_s
puts "VALOR A"
puts "#{MA.valor}"
puts "#{MA.pos}"
MB.to_s
puts "VALOR B"
puts "#{MB.valor}"
puts "#{MB.pos}"
MS = MA + MB
MT.to_s

puts "CLASE DE MA  #{MA.class}"
puts "CLASE DE MB  #{MB.class}" 


#MC = Sparse.new(2,2)
#MD = Sparse.new(2,2)

#MC.fill_M([],[])
#MD.fill_M([],[])

#M6.to_s
puts "OPERADORES"

aux = (M3+M11)
aux.to_s
M6.to_s
 
if ((aux) == (M6))
	puts "BIEN"
	else
	puts "BAD"
end


#Mp.to_s

#M7 = M - M4

#M1.to_s
#M2.to_s
#puts M1.max
#puts M4.max
#puts M4.min

#puts M1.max
#puts M3.min


#M5.to_s
#M6.to_s
#M7.to_s
