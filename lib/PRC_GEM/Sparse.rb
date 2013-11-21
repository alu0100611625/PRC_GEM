require "./lib/PRC_GEM/matriz.rb"
require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Densa.rb"


class Sparse < Matriz

attr_reader :row, :col, :valor, :pos 

	def initialize (m,n)
		raise TypeError, "Error. Dimensiones incorrectas" if ((m < 0) or (n < 0))
		@row, @col = m, n
		@valor = Array.new(0) {}
		@pos = Array.new(0){}
	end
	
	def fill_M (pos,dat)
	if dat.is_a?(Array) and pos.is_a?(Array)
    for i in (0...pos.size)
      @pos << pos[i]
      @valor << dat[i]
    end
	end
	end
	
	 def coerce(other)
     if (other.is_a?(Densa))
    a=Sparse.new(other.row,other.col)
    for i in (0...other.row)
      for j in (0...other.col)
	if (other.m[i][j] != 0)
	  a.pos << [i,j]
	  a.dato << other.m[i][j]
	end
      end
    end
    return[a,self]
    end
  end
		  
	def to_s
		aux = Densa.new(self.row,self.col)
		aux = (aux.coerce(self))[0]
		puts aux.to_s
	end
	
	def buscar (i,j) #devuelve una posicion del array que coincide con los indices de los param
		aux=[i,j]
		posicion= -1
		k=0
		while (k < @pos.size) and (posicion==-1)
		  if (@pos[k]==aux)
			posicion=k
		  end
			k=k+1
		end
			posicion
	end
	
	##SUMA##
	
	def +(other)
    raise unless other.is_a?(Matriz) # Deben Ser Matrices
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      nueva= Sparse.new(@row,@col)
      for i in (0...@pos.size)
        k = other.buscar(@pos[i][0],@pos[i][1])
        if (k!= -1) #Si existe
         if (@valor[i]+other.valor[k]) != 0
         nueva.pos << @pos[i]
         nueva.valor << (@valor[i]+other.valor[k])
         end
        else
         nueva.pos << @pos[i]
         nueva.valor << @valor[i]
        end
      end 
      for i in (0...other.pos.size) #almacenamos los que no se hayan sumado de la otra matriz
        k = nueva.buscar(other.pos[i][0],other.pos[i][1])
        if (k==-1)
         nueva.pos << other.pos[i]
         nueva.valor << other.valor[i]
        end
      end
    else
      puts "No se pueden sumar, no tienen las mismas dimensiones"
    end #if
    nueva
  end
  
  ## RESTA
  
   def -(other)
    raise unless other.is_a?(Matriz) #deben ser matrices, da = si se comparan densas con dispersas
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      nueva= Sparse.new(@row,@col)
      for i in (0...@pos.size)
        k = other.buscar(@pos[i][0],@pos[i][1])
        if (k!= -1) #existe esa pos
         nueva.pos << @pos[i]
         nueva.valor << (@valor[i]-other.valor[k])
        else
         nueva.pos << @pos[i]
         nueva.valor << @valor[i]
        end
      end #for
      for i in (0...other.pos.size) #almacenamos los que no se hayan sumado de la otra matriz
        k = nueva.buscar(other.pos[i][0],other.pos[i][1])
        if (k==-1)
         nueva.pos << other.pos[i]
         nueva.valor << -other.valor[i]
        end
      end
    else
      puts "No se pueden restar, no tienen las mismas dimensiones"
    end #if
    nueva
  end
  
  def max
    r = -999999
    aux=valor
    aux<< 0
    for i in (0...@valor.size)
      if (aux[i].to_f>r)
        r=aux[i]
      end
    end
    r
  end

  def min
    r = 999999
    aux=valor
    aux<< 0
    for i in (0...@valor.size)
      if (aux[i].to_f<r)
        r=aux[i]
      end
    end
    r
  end
  
  def ==(other)
    raise unless other.is_a?(Matriz) #deben ser matrices, da = si se comparan densas con dispersas
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      if (@pos.size == 0) #si ambos estan estan vacios...
        return true
      elsif
        for i in (0...@pos.size)
         k = other.buscar(@pos[i][0],@pos[i][1])
         if ( k!= -1) #existe esa pos
         if (@valor[i] == other.valor[k])
         return true
         end
         end
        end #for
      end
      false
    end #if
  end
end

