require "./racional.rb"
require "./Sparse.rb"
require "./matriz.rb"
require "./Densa.rb"
M1 = Densa.new(3,3)
M2 = Sparse.new(3,3)

M3 = Densa.new(3,3)
M4 = Sparse.new(3,3)



M1.fill_M([[10,2,3],[44,5,6],[7,8,9]])
M2.fill_M([[0,0],[1,1],[2,2]],[1,2,3])

M3.fill_M([[10,2,3],[44,5,6],[7,8,9]])
M4.fill_M([[0,0],[1,1],[2,2]],[1,2,3])

M5 = M1 * M3
M6 = M1 - M2
#M7 = M2 - M4

M1.to_s
M2.to_s

puts M4.max
puts M4.min

puts M1.max
puts M3.min


#M5.to_s
#M6.to_s
#M7.to_s
