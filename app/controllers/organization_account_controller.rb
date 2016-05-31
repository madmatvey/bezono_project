class OrganizationAccountController < ApplicationController
  def new
      @organization_account = OrganizationAccount.new
      current_user.organization_account << @organization_account
      @organization_profile = current_user.organization_account.organization_profile.build
  end


  def create
    @organization_profile = current_user.organization_account.organization_profile.build(organization_profile_params)

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
end
