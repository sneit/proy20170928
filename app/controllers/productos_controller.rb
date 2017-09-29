require File.join(Rails.root, "app", "models", "Producto.rb")

class ProductosController < ApplicationController
  layout 'zonaprivada'
    
  def nuevo
  end
  
  def buscar_get
      @txt_nombre_producto = params[:txt_nombre_producto] 

      ######### 1 ############
      #producto = Producto.find(1)
      #Rails.logger.debug("------ Precio del Producto --------> " + producto.precio.to_s)
      
      ######### 2 ############
      #productos = Producto.take(3)
      #if productos.nil?
      #  Rails.logger.debug("--------------> esta vacio!... ")
      #else
      #  productos.each do |p|
      #    Rails.logger.debug("--------------> " + p.precio.to_s)
      #  end
      #end
      
      ######### 3 ############
      #productos = Producto.find_by_sql("select * from productos where nombre like '%"+@txt_nombre_producto+"%'")
      @productos = Producto.where(['nombre LIKE ?', "%#{@txt_nombre_producto}%"])
      if @productos.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
      else
        @productos.each do |p|
          Rails.logger.debug("--------------> " + p.precio.to_s)
        end
      end 
      render "buscar"
  end


  def buscar
  end
  
  def nuevo_post
    @txt_nombre_producto = params[:txt_nombre_producto]   
    @num_precio_producto = params[:num_precio_producto]
    
    Rails.logger.debug("--------------> " + @txt_nombre_producto)
    Rails.logger.debug("--------------> " + @num_precio_producto)
    
    prod =  Producto.new(:nombre => @txt_nombre_producto, :precio => @num_precio_producto)
    prod.save
    

    Rails.logger.debug("--------------> " + prod.nombre)
       
    render "nuevo"
    
  end
  
end
