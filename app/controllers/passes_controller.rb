class PassesController < ApplicationController

  before_action :set_pass, only: [:show, :edit,  :update, :destroy,:print]

  before_action :get_profile
  before_action :authenticate_user!
  # GET /passes
  # GET /passes.json
  #around_action :switch_locale
 
  #def switch_locale(&action)
  #  locale = params[:locale] || I18n.default_locale
  #  I18n.with_locale(locale, &action)
  #end
  def index

    p params 
    p current_user 

    p "INDEX PASSES"
    p Profile.where(user_id: current_user.id) 

    p "INDEX PASSES"
    if ( @profiles.user_id == current_user.id or User.find(current_user.id).admin )
              @passes = @profiles.passes.paginate(page: params[:page],per_page: 10).order(date: :desc)
    else
      redirect_to root_path

    end

  end

  # GET /passes/1
  # GET /passes/1.json
  def show

    #@profile = params[:profile_id]
    #@profile = Profile.where(user_id: current_user.id)
  end

  # GET /passes/new
  def new

      @pass = @profiles.passes.new
      @bildings = Bilding.all

      #@profile = params[:profile_id]
    
  end

  # GET /passes/1/edit
  def edit

    #@profile = Profile.where(user_id: current_user.id)

    @profile = params[:profile_id]
#    @profile_pdf = Profile.all.find(@pass.company_id )
  end

  def print

    require 'smsc_api'
    sms =  SMSC.new()
    #@profile_pdf = Profile.all.find(@pass.user_id )
 
    bild =   Bilding.where(name: @pass.bild).take
    @pass = @profiles.passes.find(params[:id])

    check_pass =   @pass.report_sms.nil? 

    if check_pass
       

    sms_company_name = @profiles.company_name
    sms_passes_name = @pass.name
    sms_passes_date = @pass.date 
    sms_passes_description = @pass.description
    sms_passes_bild = @pass.bild 
    p sms.methods
  
    res = sms.send_sms(bild.telefon ,"#{check_pass} Пропуск в строение: #{sms_passes_bild})  #{sms_company_name}: #{sms_passes_name} / #{sms_passes_description} - #{sms_passes_date}",1) if bild.telefon.length == 11
   if params[:action] == "print"

	      p @pass.print_pass
         
	       @pass.print_pass = true

         @pass.report_sms = Time.now() 
         @pass.report_print = Time.now()
         if @pass.save
              PassMailer.with(pass: @pass).pass_mail.deliver_now 
	            redirect_to profile_passes_path 
         end
      end


     

    pdf = WickedPdf.new.pdf_from_string( 
      render_to_string('pdf', layout: 'layout_pdf.html.erb'),
    page_size: 'A4',
    orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75,
    template: 'pdf.html.erb' ,
    encoding: "UTF-8"

    )

    bild.summa += 1

    bild.save
    #orientation: "Landscape",
    filename = "file#{@pass.id}.pdf"
    save_path = Rails.root.join('pdfs',filename)
        File.open(save_path, 'wb') do |file|
        file << pdf
      end

        printer = CupsPrinter.new(bild.printer_name)
        job = printer.print_file( "#{Rails.root.join('pdfs')}/#{filename}" , {'PageSize' => 'A4',"landscape" => 'yes' })
 
  else
  # 
     redirect_to root_path
    end
  end
  # POST /passes
  # POST /passes.json
  def create

    @pass = @profiles.passes.new(pass_params)


    p "Создание Pass"
     @pass
  
    p "Создание Pass"
    @profile = Profile.where(["user_id = '%s' and id = '%s'", @pass.user_id,@pass.profile_id])


    p @pass.user_id
    p @profile
    respond_to do |format|
      if @pass.save
        format.html { redirect_to profile_passes_path(@profiles), notice: 'Создание заявки на проход' }

      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /passes/1
  # PATCH/PUT /passes/1.json
  def update
    respond_to do |format|
      if @pass.update(pass_params)
        format.html { redirect_to profile_passes_path(@profiles), notice: 'Заявка обновлена.' }
        format.json { render :show, status: :ok, location: @pass }
      else
        format.html { render :edit }
        format.json { render json: @pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passes/1
  # DELETE /passes/1.json
  def destroy
    @pass.destroy
    respond_to do |format|
      format.html { redirect_to profile_passes_path(@profiles), notice: 'Заявка удалена' }
      format.jsonly { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pass
     begin 
      @pass = Profile.find(params[:profile_id]).passes.find(params[:id])

      p "SET PASS #{@pass}"

      rescue ActiveRecord::RecordNotFound
              redirect_to root_url
      end
    end
    def get_profile
      begin
                @profiles = Profile.find(params[:profile_id])
      rescue ActiveRecord::RecordNotFound
              redirect_to root_url
      end
 
    end

    def pass_params
      params.require(:pass).permit(:name, :description, :date ,:bild,:user_id,:profile_id)
    end
end
