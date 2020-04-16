class ApplicationController < ActionController::Base
	 #skip_before_action :verify_authenticity_token
   #protect_from_forgery with: :exception   
 skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' or  controller_name == 'passes'  or controller_name == 'profiles' or controller_name = 'managments' }
   #protect_from_forgery with: :null_session#
#protect_from_forgery prepend: true, with: :exception
  #:x
 #rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   private
   def record_not_found
           render html: "404 Record <strong>not found</strong>", status: 404
   end 
end
