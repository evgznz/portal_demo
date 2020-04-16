class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show ,:edit ,:update]
  before_action :authenticate_user!
  def index
     begin
     @company_profiles = Profile.all.where(user_id: current_user.id,company_active: true)

     rescue
       render 'new'

     end
  end
  def show
    redirect_to root_path unless  @profile.user_id == current_user.id
  end

  def create
    if current_user.admin
        @profile = Profile.new(profile_params)
        @profile.bild.gsub!(/[",\[\]]/," ")

        respond_to do |format|
          if @profile.save 
              format.html {  redirect_to managements_path , notic: "Профиль компании создан " }
              ProfileMailer.with(profile: @profile).profile_mail.deliver_now

              else
              format.html { render :new }
          end

        end
    else
      redirect_to root_path
    end
  end
  def new 
    if current_user.admin 
        @profile = Profile.new
    else

           redirect_to root_path
    end
    
  end 
  def edit
         @profile = Profile.find(params[:id])


      if @profile.user_id == current_user.id 

         @profile.bild.gsub!(/[",\[\]]/," ")
      elsif current_user.admin

         @profile.bild.gsub!(/[",\[\]]/," ")
      else
      redirect_to managements_path
    end

  end
  def destroy
  end
  def update

        p profile_params 
        p @profile
   @profile.bild.gsub!(/[",\[\]]/," ")
   
        p @profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to managements_path ,notice: "Профиль \" #{@profile.company_name}\" обновили" }
       
      else

        format.html { redirect_to @profile,notice: "Ошибка при обновлении профиля \" #{@profile.company_name}\"" }
       
      end
    end
  end
  private
  def set_profile

    begin
      @profile =  Profile.find(params[:id])

      @bilds = Bilding.all
      @passes = Pass.where(user_id: params[:id])
      rescue ActiveRecord::RecordNotFound
              redirect_to root_url
      end
 
    end
    def profile_params
          params.require(:profile).permit(:company_name,:company_address,:company_active,:company_description, 
            :telefon_mobile,:contact_name,:print_header,:print_cellar,:company_inn,:agreement,
            :company_org_address,:company_bank,:company_inn,:company_kpp,:company_email,:user_id,bild: [])
    

    end


end
