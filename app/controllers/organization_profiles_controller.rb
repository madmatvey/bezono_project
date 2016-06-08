class OrganizationProfilesController < ApplicationController
  before_action :set_organization_profile, only: [:show, :edit, :update, :destroy]

  # GET /organization_profiles
  # GET /organization_profiles.json
  def index
    @organization_profiles = policy_scope(OrganizationProfile).all
    authorize User
  end

  # GET /organization_profiles/1
  # GET /organization_profiles/1.json
  def show
    authorize @organization_profile
  end

  # GET /organization_profiles/new
  def new
    @organization_profile = OrganizationProfile.new
    authorize @organization_profile
  end

  # GET /organization_profiles/1/edit
  def edit
    authorize @organization_profile
  end

  # POST /organization_profiles
  # POST /organization_profiles.json
  def create
    @organization_profile = OrganizationProfile.new(organization_profile_params)
    current_user.organization_account.organization_profiles << @organization_profile 
    authorize @organization_profile
    respond_to do |format|
      if @organization_profile.save
        format.html { redirect_to @organization_profile, notice: 'Organization profile was successfully created.' }
        format.json { render :show, status: :created, location: @organization_profile }
      else
        format.html { render :new }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_profiles/1
  # PATCH/PUT /organization_profiles/1.json
  def update
    respond_to do |format|
      if @organization_profile.update(organization_profile_params)
        authorize @organization_profile
        format.html { redirect_to @organization_profile, notice: 'Organization profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_profile }
      else
        format.html { render :edit }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_profiles/1
  # DELETE /organization_profiles/1.json
  def destroy
    authorize @organization_profile
    @organization_profile.destroy
    respond_to do |format|
      format.html { redirect_to organization_profiles_url, notice: 'Organization profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_profile
      @organization_profile = OrganizationProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_profile_params
      params.require(:organization_profile).permit(:inn,
          :address_value,
          :kpp,
          :management_name,
          :management_post,
          :name_full_with_opf, #Полное наименование с ОПФ
          :name_short_with_opf, #Краткое наименование с ОПФ
          :name_latin, #Наименование на латинице
          :name_full, #Полное наименование
          :name_short, #Краткое наименование
          :ogrn, #ОГРН
          :okved, #Код ОКВЭД
          :opf_code, #Код ОКОПФ
          :opf_full, #Полное название ОПФ
          :opf_short, # Краткое название ОПФ
          :state_actuality_date, #Дата актуальности сведений
          :state_registration_date, #Дата регистрации
          :state_liquidation_date, #Дата ликвидации
          :state_status, # Статус организации ACTIVE — действующая; LIQUIDATING — ликвидируется; LIQUIDATED — ликвидирована.
          :org_type #Тип орг
          )
    end
end
