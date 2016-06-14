class AccreditationsController < ApplicationController
  # include Wicked::Wizard


  def new
    @accreditation = Accreditation.new
  end

  def edit
    @accreditation = Accreditation.find(accreditation_params)
  end

  def show
    @accreditation = Accreditation.find(secure_params)
  end


  def update

    @accreditation = find_accreditation

    if @accreditation.update_attributes(accreditation_params)
      flash[:success] = "Accreditation updated!"
      redirect_to ([@accreditation.organization_profile, @accreditation])
    else
      render :action => "edit"
    end
  end

private

  def accreditation_params
    params.require(:accreditation).permit(:accreditation_id, :id, :state, :organization_profile_id)
  end

  def find_accreditation
    if params[:accreditation_id]
      @accreditation = Accreditation.find(params[:accreditation_id])
    end
  end
end
