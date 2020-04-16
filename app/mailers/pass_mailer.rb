class PassMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.profile_mailer.mail.subject
  #
   def pass_mail
    @pass = params

    #@user = User.where(email: params[:email]).take
     @profile_mail  = Profile.find(@pass[:pass].profile_id)
     print @pass
     print @profile_mail 
     company_email = @profile_mail.company_email
     @pass_mail = @pass[:pass]
     #company_email = 'it@intitex.ru'
     begin 
            if true 
              delivery_options = { user_name: "",password: "",address: ""}
            else
              delivery_options = { user_name: "", password: "",address: ""}
            end
            subject = "Уведомление о создании заявки на проход "
            mail(to: company_email ,subject: subject ,delivery_method_options: delivery_options)
            #mail(to: "av@mpmz.ru",subject: subject ,delivery_method_options: delivery_options)

     rescue Exception => error
        print "Error mail #{error} "
     end
  end
   def login_password
      @user = User.where(email: params[:email]).take

    delivery_options = { user_name: "",
                         password: "",
                         address: ""}
   
     @password =  [*('a'..'z'),*('0'..'9')].shuffle[0,8].join 
 
     @user.update(password: @password, password_confirmation: @password,password_name: @password)
      @login = @user.email
      subject = "Новый пароль создан"
      mail(to: @login,subject: subject ,delivery_method_options: delivery_options)
   end
    def disable_login_password
      @user = User.where(email: params[:email]).take

    delivery_options = { user_name: "",
                         password: "",
                         address: ""}
   
     @password =  [*('a'..'z'),*('0'..'9')].shuffle[0,8].join 
 
     @user.update(password: @password, password_confirmation: @password,password_name: @password)
      @login = @user.email
      subject = "Пользователь отключен"
      mail(to: @login,subject: subject ,delivery_method_options: delivery_options)
   end
  

end
