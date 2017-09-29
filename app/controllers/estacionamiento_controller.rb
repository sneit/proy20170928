require File.join(Rails.root, "app", "models", "Estacionamiento.rb")

class EstacionamientoController < ApplicationController
  layout 'zonaprivada'
  
  def buscar_est
    
  end
  
  
  def buscar_est_get
    
    @txt_dni = params[:txt_dni] 
      
      @estacionamiento = Estacionamiento.find_by_sql("select id, dni,  case when est = 1 then 'el agustino' else 'sandy me' end as est1, hr_ingreso, hr_salida from estacionamiento where dni like '%"+@txt_dni+"%'")
      #@estacionamiento = Estacionamiento.where(['dni LIKE ?', "%#{@txt_dni}%"])
      if @estacionamiento.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
      else
        @estacionamiento.each do |p|
          Rails.logger.debug("--------------> " + p.dni.to_s)
        end
      end 
      render "buscar_est"
  end
  
  def nuevo_est
  end
  
  def nuevo_est_post
    @doc = params[:doc]
    @est = params[:est]
    @hrIni = params[:hrIni]
    @hrFin = params[:hrFin]
    
    
    estac =  Estacionamiento.new(:dni => @doc, :est => @est, :hr_ingreso => @hrIni, :hr_salida => @hrFin)
    estac.save
       
    render "nuevo_est"
    
  end
  
end
