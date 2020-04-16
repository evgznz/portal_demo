#!/usr/bin/env ruby
require 'cupsffi'
require 'snmp'
error_spool = {}
percent_spool = {}
percents = {} 
printers =  CupsPrinter.get_all_printer_names
p printers
CupsPrinter.get_all_printer_names.each do  |item|
  item_printer  =  CupsPrinter.new(item)

  unless item_printer.get_all_jobs.empty?

     summa = item_printer.get_all_jobs.length
     item_printer.get_all_jobs.each do |item_job|
         error_spool[item_job[:dest]] = summa 
     end
  end

end
name_printers = ['11','37','41','42','43']
name_printers = ['42']
  name_printers.each do |item|
  begin
SNMP::Manager.open(:host => "10.0.29.#{item}") do |manager|
  #response = manager.get(["sysDescr.0", "sysName.0","sysUpTime.0"])
  response = manager.get("1.3.6.1.2.1.43.10.2.1.4.1.1")

    response.each_varbind do |vb|
        puts "#{vb.name.to_s}  #{vb.value.to_s}  #{vb.value.asn1_type}"
        percent_pages =   100 - (vb.value.to_i*100)/1600
        case percent_pages
        when 0 .. 96 
            puts "ERROR #{percent_pages}%"
            percents["percent_pages"] = percent_pages
            percents["pages"] = vb.value.to_i
            percents["css"] = "bg-danger"
            percents["critical"] = true
            percent_spool[item] = percents

        when 96 .. 98
            puts "WARNING #{percent_pages}%"
            percents["percent_pages"] = percent_pages
            percents["pages"] = vb.value.to_i
            percents["css"] = "bg-warning"
            percent_spool[item] = percents


        when 98 .. 100
            puts "OK #{percent_pages}%"
            percents["percent_pages"] = percent_pages
            percents["pages"] = vb.value.to_i
            percents["css"] = "bg-seccess"
            percent_spool[item] = percents


        end
    end
end

 rescue StandardError => e
    error =  "Error: #{e}"

    error_spool[item] = error
end
end
  
p error_spool
p percent_spool
