class ProfileMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.profile_mailer.mail.subject
  #
  def profile_mail
    @greeting = "Profile #{params}" 
    @profile = params[:profile]

    if false 
    delivery_options = { user_name: "",
                         password: "",
                         address: ""}
    else
    delivery_options = { user_name: "", 
                         password: "",
                         address: ""}
    end
    subject = "Уведомление о создании нового профиля компании \"#{@profile.company_name}\""
    mail(to: "iinfo@mail.ru",subject: subject ,delivery_method_options: delivery_options)
    #mail(to: "av@mpzm.ru",subject: subject ,delivery_method_options: delivery_options)
  end
end
