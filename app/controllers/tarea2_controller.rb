class Tarea2Controller < ApplicationController
  layout 'zonaprivada'
  
  def calcular
  end

  def calcular_post
    @opeA = params[:opeA]   
    @opeB = params[:opeB]  
    @opeC = params[:opeC]
    
    @valA = ""
    @Ingresado = ""
    
    if @opeA == "" || @opeA.to_i == 0 || @opeB == "" || @opeB.to_i == 0 || @opeC == "" || @opeC.to_i == 0
      @valC = "Debe ingresar todos los número para poder calcular"
    else
      @Ingresado = "Valores Calculados "+ params[:opeA] +", "+  params[:opeB] +", "+  params[:opeC]
      
      Rails.logger.debug("--------------> " + @opeA)
      Rails.logger.debug("--------------> " + @opeB)
      Rails.logger.debug("--------------> " + @opeC)
      @X1 = 0
      @X2 = 0
      
      @Calcular = ((@opeB.to_i**2)-(4*(@opeA.to_i*@opeC.to_i)));
      
      @X1 = (- @opeB.to_i + Math.sqrt(@Calcular)) / 2*@opeA.to_i
      @X2 = (- @opeB.to_i - Math.sqrt(@Calcular)) / 2*@opeA.to_i
      
    end 
    
    render 'calcular'
  end

  def rando
  end
  
  def rando_post
    @NumA = params[:txt_num_a]   
    @NumB = params[:txt_num_b]  
    @NumC = params[:txt_num_c]  
    @NumD = params[:txt_num_d]  
    @rotar = params[:rotar] 
    
    @resultado = 0
    @valor = [@NumA.to_i, @NumB.to_i, @NumC.to_i, @NumD.to_i]
    @Ingresado = "Valores Eningresado "+@valor.to_s
      
    #@result = @valor.split(",")
    
    @result1 = ""
    @result2 = ""
    @result3 = ""
    @result4 = ""

    if @rotar == "1"
      
      @resultado = @valor.sort.reverse
      
      #@resultado = @valor.rotate(2)
      @result1 =  @resultado[0] 
      @result2 =  @resultado[1] 
      @result3 =  @resultado[2] 
      @result4 =  @resultado[3] 
      
    elsif @rotar == "2"
    
      @resultado = @valor.sort
      #@resultado = @valor.rotate(3)
      @result1 =  @resultado[0] 
      @result2 =  @resultado[1] 
      @result3 =  @resultado[2] 
      @result4 =  @resultado[3]
      
    end
  
    render 'rando'
  end
end
