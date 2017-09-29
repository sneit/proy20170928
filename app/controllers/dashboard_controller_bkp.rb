require File.join(Rails.root, "app", "models", "Distrito.rb")
require File.join(Rails.root, "app", "models", "Rol.rb")
require File.join(Rails.root, "app", "models", "TipoDocumento.rb")
require File.join(Rails.root, "app", "models", "Persona.rb")

class DashboardController < ApplicationController
  layout 'zonaprivada'
  def index
  end
  
  def persona
    @distritos = Distrito.find_by_sql("select id_distrito, nombre_dist from distrito")
    @roles = Rol.find_by_sql("select id_rol, nombre from rol")
    @tipodocumentos = TipoDocumento.find_by_sql("select id_tipo_doc, nombre_doc from tipo_documento")
    @persona = Persona.find_by_sql("select id_persona, nro_documento, nombre, ape_paterno, ape_materno, fec_nacimiento, sexo, email, password, celular, direccion, id_tipo_doc, id_rol, id_distrito from persona")
    
    render "persona"
  end

  def persona_post
  
    @nro_documento = params[:nroDoc]
    @nombre = params[:nomCli]
    @ape_paterno = params[:apeParCli]
    @ape_materno = params[:apeMarCli]
    @fec_nacimiento = params[:fecNac]
    @sexo = params[:sexo]
    @email = params[:email]
    @password = params[:pass]
    @celular = params[:nroCel]
    @direccion = params[:Dir]
    @id_tipo_doc = params[:tipdoc]
    @id_rol = params[:perfil]
    @id_distrito = params[:dis]
   
    pers =  Persona.new(:nro_documento => @nro_documento, :nombre => @nombre, :ape_paterno => @ape_paterno, :ape_materno => @ape_materno, :fec_nacimiento => @fec_nacimiento, :sexo => @sexo, :email => @email, :password => @password, :celular => @celular, :direccion => @direccion, :id_tipo_doc => @id_tipo_doc, :id_rol => @id_rol, :id_distrito => @id_distrito)
    pers.save
       
    render "persona"
    
  end
  
  def local
  end

  def canchita
  end

  def alquiler
  end

  def servicioadicional
  end

  def listaalquiler
  end

  def publicidad
  end

  def acceso
  end
end
