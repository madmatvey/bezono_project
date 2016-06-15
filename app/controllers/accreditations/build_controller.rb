class Accreditations::BuildController < ApplicationController
  include Wicked::Wizard

  steps :step1, :step2, :step3

  def show
    @accreditation = find_accreditation
    render_wizard
  end


  def update
    @accreditation = find_accreditation
    if @accreditation.update_attributes(accreditation_params)
      render_wizard @accreditation, notice: "Accreditation updated!"
    else
      render :action => "edit"
    end
  end


  def create
    @accreditation = Accreditation.create
    redirect_to wizard_path(steps.first, :accreditation_id => @accreditation.id)
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
