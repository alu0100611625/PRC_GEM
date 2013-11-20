require "./lib/Densa.rb"
require "./lib/Sparse.rb"



describe Matriz do
  

  before :each do
    @m1 = Densa.new(2,2)
    @m1.fil_M([[1,2],[3,4]])

    @m2 = Densa.new(2,2)
    @m2.fil_M([[4,3],[2,1]])

    @m3 = Densa.new(2,2)
    @m3.fil_M([[Racional.new(1, 1),Racional.new(1, 1)],[Racional.new(1, 1),Racional.new(1, 1)]])

    @m4 = Densa.new(2,2)
    @m4.fil_M([[Racional.new(1, 2),Racional.new(3, 4)],[Racional.new(4, 3),Racional.new(3, 6)]])

    
    @m5 = Sparse.new(2,2)
    @m5.fil_M([[0,1]],[5])

    @m6 = Sparse.new(2,2)
    @m6.fil_M([[1,0]],[5])

    @m7 = Sparse.new(2,2)
    @m7.fill_M([[1,1]],[Racional.new(1, 2)])

    @m8 = Sparse.new(2,2)
    @m8.fill_M([[0,0]],[Racional.new(5, 3)])

  end
  
  describe "# Definición de argumentos: " do

    it " - Las dimensiones son correctas" do

      @m1.fil.should eq(2)

      @m1.col.should eq(2)

      @m5.fil.should eq(2)

      @m5.col.should eq(2)

    end
    it "- Contenido de la matriz densa" do

        @m9 = Densa.new(2,2)

        @m9.fill_M([[1,2],[3,4]])

        (@m1==@m9).should eq(true)

    end
    it "- Contenido de la matriz dispersa" do

        @m9 = Sparse.new(2,2)

        @m9.fill_M([[0,1]],[5])

        aux= (@m5 == @m9)

        aux.should eq(true)
    end

  end
   
  describe "# Operación con matrices: "do

    it "- Se pueden sumar matrices densas de enteros" do
      @m9 = Densa.new(2,2)

      @m9.fill_M([[5,5],[5,5]])

      (@m1+@m2).should == @m9

    end
    it "- Se pueden sumar matrices densas de racionales" do

      @m9 = Densa.new(2,2)

      @m9.fill_M([[Racional.new(3, 2),Racional.new(7, 4)],[Racional.new(7, 3),Racional.new(9, 6)]])

      (@m3+@m4).should == @m9

    end

    it "- Se pueden sumar matrices dispersas de racionales" do

      @m9 = Sparse.new(2,2)

      @m9.fill_M([[0,0],[1,1]],[Racional.new(5, 3),Racional.new(1, 2)])

      (@m7+@m8).should == @m9

    end  
  
    it "- Se pueden sumar matrices de enteros con racionales entre las distintas clases" do

      @m9 = Densa.new(2,2)

      @m9.fill_M([[Racional.new(2, 3),Racional.new(1, 1)],[Racional.new(2, 1),Racional.new(-5, 1)]])

      (@m2+@m8).should == @m9

    end
    
    
    it "- Se pueden restar matrices densas de enteros" do

      @m9 = Densa.new(2,2)

      @m9.fill_M([[-3,-1],[1,3]])

      (@m1-@m2).should == @m9

    end
  
    it "- Se pueden restar matrices dispersas de enteros" do

      @m9 = Sparse.new(2,2)

      @m9.fill_M([[0,1],[1,0]],[5,-5])

      (@m5-@m6).should == @m9

    end
  

   it "- Maximo de densas con enteros" do

      @m2.max==4
    end
  
    it "- Minimo de dispersas con enteros" do

      @m5.min==0
    end
  
  end
end
