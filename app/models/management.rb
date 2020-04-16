class Management < ApplicationRecord

  #validates_email_format_of :login ,messange: "Ошибка формата login email"
  def sms_password
     p 'SMS SEND'
     
  end
end
