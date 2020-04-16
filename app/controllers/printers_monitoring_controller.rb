class PrintersMonitoringController < ApplicationController

  before_action :authenticate_user!
  def index 

    if current_user.admin 
        @printers = Bilding.all

     else 
         redirect_to root_path
     end 
  end
  def check 
    if current_user.admin 
        
        require 'snmp'
        error = {}
        item = params[:id]

        bilding = Bilding.where(name: item).take
                # end
      begin
        SNMP::Manager.open(:host => "10.0.29.#{item}") do |manager|
        response = manager.get("1.3.6.1.2.1.43.10.2.1.4.1.1")

        response.each_varbind do |vb|
        #puts "#{vb.name.to_s}  #{vb.value.to_s}  #{vb.value.asn1_type}"
        percent_pages =   100 - (vb.value.to_i*100)/1600
        case percent_pages
        when 0 .. 93 

            bilding.comment  = "ERROR #{percent_pages}%"
            bilding.pages_print  = vb.value.to_i
            bilding.pages_percent = percent_pages 
            bilding.pages_css  = "bg-danger"
            bilding.pages_critical  = true
            bilding.check_time = Time.now()
           
        when 94 .. 97

            bilding.comment  = "WARNING #{percent_pages}%"
            bilding.pages_print  = vb.value.to_i
            bilding.pages_percent = percent_pages 
            bilding.pages_css  = "bg-warning"
            bilding.check_time = Time.now()


        when 98 .. 100
            bilding.comment  = "OK #{percent_pages}%"
            bilding.pages_print  = vb.value.to_i
            bilding.pages_percent = percent_pages 
            bilding.pages_css  = "bg-success"
            bilding.check_time = Time.now()


        end
      end
     end

     rescue StandardError => e
          error =  "Error: #{e} "


     end
    
    bilding.error_spool = error 
    bilding.percent_spool = ""
    bilding.save
    redirect_to printers_monitoring_index_path
     else 
         redirect_to root_path
     end 


  end


         
  def disable_sms

    bild =  Bilding.find(params[:id])
    number_disable  = "disable_#{bild.telefon}"
    bild.telefon = number_disable
    bild.save
    redirect_to printers_monitoring_index_path
  end
  def enable_sms
bild =  Bilding.find(params[:id])
    #number_enable  =   bild.telefon[8..18]
 
    number_enable = "79652059670"
    bild.telefon = number_enable
    bild.save

    redirect_to printers_monitoring_index_path
  end
end

