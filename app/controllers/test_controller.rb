class TestController < ApplicationController
  layout 'zonaprivada'
  
  def tab1
  end

  def tab1_post
    @txt_nombre_producto = params[:txt_nombre_producto]   
    @num_precio_producto = params[:num_precio_producto]
    
    Rails.logger.debug("--------------> " + @txt_nombre_producto)
    Rails.logger.debug("--------------> " + @num_precio_producto)
    
    render "tab1"
  end

  def tab2
  end

  def tab2_post
    @txt_nombre_numero = params[:txt_nombre_numero]   
    
    Rails.logger.debug("--------------> " + @txt_nombre_numero)
    
    render "tab2"
  end
  
  def tab3
  end

  def tab3_post
    @opeA = params[:opeA]   
    @opeB = params[:opeB]  
    @operador = params[:operador]  
    
    Rails.logger.debug("--------------> " + @opeA)
    Rails.logger.debug("--------------> " + @opeB)
    Rails.logger.debug("--------------> " + @operador)
    
    @resultado = 0
    
    if @operador == "1"
      @resultado = @opeA.to_i + @opeB.to_i
    elsif @operador == "2"
     @resultado = @opeA.to_i - @opeB.to_i
    elsif @operador == "3"
     @resultado = @opeA.to_i * @opeB.to_i
    elsif @operador == "4"
     @resultado = @opeA.to_i / @opeB.to_i
    end
    
    render 'tab3'
  end

  def tab4
  end
  
   def tab4_post
    @opeA = params[:opeA]   
    @opeB = params[:opeB]  
    
    Rails.logger.debug("--------------> " + @opeA)
    Rails.logger.debug("--------------> " + @opeB)
    
    @resultado2 = 0
    
    if @opeA.to_i & @opeB.to_i
      @resultado2 = 0
    elsif @opeA.to_i | @opeB.to_i
     @resultado2 = 1
    elsif @opeA.to_i ^ @opeB.to_i
     @resultado2 = 2
    end
    
    render 'tab4'
  end
  
  def tab5
  end
end
