class ManagementsController < ApplicationController

  before_action :set_management, only: [ :show ,:edit, :update, :destroy]

  before_action :authenticate_user!
  def index

    if current_user.admin
     @profiles = Profile.all
    else
      redirect_to root_path
    end
  end
  def show

    unless current_user.admin

      redirect_to root_path
    end
  end

  def edit

  end 
  def new 
    if current_user.admin
    @management = User.new()

    else 
      redirect_to root_path
    end
  end 
  def create

    if current_user.admin
    p "CREATE "
p params
management_params[:password_name] = management_params[:password]
    #if User.find(current_user.id).admin
 
 @management = User.new(management_params)
# respond_to do |format|
 if @management.save
    redirect_to(managements_path)
 #end
 end
 #   if false
 #
 #      login = management_params[:login]
 #     password = management_params[:password]
 #     #@user =  User.new(management_params)
 #     @new_login = User.new(email: login,
 #                password: password,
 #                password_confirmation: password,
 #                password_name: password)
 #
 #           p  @new_login.save
 #           #  redirect_to management_index_path ,alert: 'Пользователь создан'
 #
 #             #ProfileMailer.with(user: user).user_mail.deliver_now
 #
 #
 #   else
 #     redirect_to root_path,notic: "Вы не администратор"
 #   end

    else
      redirect_to root_path
    end
  end
  def update
   unless current_user.admin

      redirect_to root_path
    end

  end
  def destroy
        unless current_user.admin

           redirect_to root_path
         end


  end
  def disable_login
     redirect_to root_path  unless current_user.admin
      email =  User.find(params[:id]).email
      if email  == 'admin' 
         redirect_to  managements_path ,alert: " нельзя отключать #{email}" 
      else 
      PassMailer.with(email: email).disable_login_password.deliver_now
      redirect_to managements_path, alert: "Пользователь отключен  #{email}" 
      user = User.find(params[:id])
      user.user_active = false 
      user.save

       end
  end
  def help 
  end
  def email_login_password 

      redirect_to root_path  unless current_user.admin
      email =  User.find(params[:id]).email
      PassMailer.with(email: User.find(params[:id]).email).login_password.deliver_now
      redirect_to managements_path, alert: "Новый пароль отправлен  #{email}" 
      user = User.find(params[:id])
      user.user_active = true
      user.save

      end
  def sms_login_password
     require 'smsc_api'
      sms =  SMSC.new()

      redirect_to root_path  unless current_user.admin
      user =   User.find(params[:id])

      sms.send_sms(user.telefon ,"Новый пароль для #{user.email}  ",1)
      redirect_to managements_path, alert: "Новый пароль отправлен  sms" 
 end
private
 def set_management 
   begin
     @management = User.find(params[:id])
     @profile = User.find(params[:id])
     p current_user
    rescue ActiveRecord::RecordNotFound
              redirect_to root_url
      end
 
   end
 def management_params
   params.require("user").permit(:email,:password)
 end
end
