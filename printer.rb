#!/usr/bin/env ruby
require 'cupsffi'
require 'whois'
require 'erb'
require 'fileutils'
require 'active_model'
require 'active_record'
require 'time'
PRINTER = ['kyocera','hp']

name_printer =  PRINTER[1]
p name_printer
FileUtils.rm Dir.glob('/var/cache/cups/*.data')

#exec("/etc/init.d/cups restart")
class Users < ActiveRecord::Base
end

class Bilding < ActiveRecord::Base
end
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "",
  password: "",
  database: "renom_production",
)
class Printer
  include ActiveModel::Validations
  attr_reader :printer_name, :printer_ip
  def initialize(printer_name,printer_ip)
    @printer_name = printer_name
    @printer_ip  = printer_ip
  end
  validates  :printer_ip , presence: true
  validates  :printer_name , presence: true
end
#whois = Whois::Client.new
#printer = Printer.new('AAA','111')


printers_conf =  File.open(File.join(Dir.pwd,'printers.conf'),"w+")


printer_conf_erb =  File.read(File.join(Dir.pwd,"printer/printer_#{name_printer}.conf.erb"))
printer_ppd_erb =   File.read(File.join(Dir.pwd,"printer/#{name_printer}.ppd.erb"))
 
Bilding.all.length.times do |item|


  @bild  = Bilding.find(item+1)
  p @bild
 # @bild.telefon = "79266#{item}00000"
  @bild.printer_name = "#{name_printer}_#{@bild.name}"

  printer_ppd_driver = "/etc/cups/ppd/#{@bild.printer_name}.ppd"

#  p printer_ppd_driver
  #@bild.printer_uid = "2017f7c4-adc0-3cac-5a6c-ea400757e8f3"

  @bild.printer_uid = "#{rand(100000..999999)}-#{rand(1000..9999)}-#{rand(1000-9999)}-#{rand(10000..99999)}"
    if name_printer  == 'kyocera' 

       @bild.printer_ip = '10.20.20.170'
    else 
      @bild.printer_ip = "10.0.29.#{@bild.name}"

    end
  @bild.save!
  conf_erb = ERB.new(printer_conf_erb)
  ppd_erb  = ERB.new(printer_ppd_erb)

  printer_ppd =  File.open(printer_ppd_driver,"w")

  printer_ppd.write(ppd_erb.result)
  printers_conf.write(conf_erb.result)

end

FileUtils.mv(printers_conf,"/etc/cups/printers.conf")
#exec("/etc/init.d/cups stop")

FileUtils.chown_R 'root' , 'lp', '/etc/cups', :verbose => true

#p CupsPrinter.get_all_printer_names
sleep 5
error_spool = {}
p CupsPrinter.get_all_printer_names
CupsPrinter.get_all_printer_names.each do  |item|
  item_printer  =  CupsPrinter.new(item)
  unless item_printer.get_all_jobs.empty?
     summa = item_printer.get_all_jobs.length
     item_printer.get_all_jobs.each do |item_job|
         error_spool[item_job[:dest]] = summa 
     end
  end
  item_printer.cancel_all_jobs

end
p error_spool
#hostname = '10.20.20.171' 
#port = '631'
#connection = CupsFFI::httpConnectEncrypt(hostname, port.to_i, CupsFFI::cupsEncryption())
#p connection.null?
