class OrganizationAccountsController < ApplicationController
  before_action :set_organization_account, only: [:show, :edit, :update, :destroy]

  # GET /organization_accounts
  # GET /organization_accounts.json
  def index
    @organization_accounts = OrganizationAccount.all
    authorize User
  end

  # GET /organization_accounts/1
  # GET /organization_accounts/1.json
  def show
    @profiles = @organization_account.organization_profile.all
    @users = @organization_account.users.all
    authorize @organization_account
  end

  # GET /organization_accounts/new
  def new
    @organization_account = OrganizationAccount.new
    authorize @organization_account
  end

  # GET /organization_accounts/1/edit
  def edit
    authorize @organization_account
  end

  # POST /organization_accounts
  # POST /organization_accounts.json
  def create
    @organization_account = OrganizationAccount.new(organization_account_params)
    authorize @organization_account
    respond_to do |format|
      if @organization_account.save
        format.html { redirect_to @organization_account, notice: 'Organization account was successfully created.' }
        format.json { render :show, status: :created, location: @organization_account }
      else
        format.html { render :new }
        format.json { render json: @organization_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_accounts/1
  # PATCH/PUT /organization_accounts/1.json
  def update
    respond_to do |format|
      if @organization_account.update(organization_account_params)
        authorize @organization_account
        format.html { redirect_to @organization_account, notice: 'Organization account was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_account }
      else
        format.html { render :edit }
        format.json { render json: @organization_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_accounts/1
  # DELETE /organization_accounts/1.json
  def destroy
    authorize @organization_account
    @organization_account.destroy
    respond_to do |format|
      format.html { redirect_to organization_accounts_url, notice: 'Organization account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_account
      @organization_account = OrganizationAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_account_params
      params.fetch(:organization_account, {})
    end
end
