class ProofsController < ApplicationController

  def create
    @competence = Competence.find(proof_params[:competence_id])
    current_user.active_profile.set_competence!(@competence)
    respond_to do |format|
      format.html { redirect_to current_user.active_profile }
      format.json
      format.js 
    end
  end

  def show
    @proof = Proof.find(proof_params)
  end

  def index
    @proofs = Proof.all
  end
  # def destroy
  #   @user = Relationship.find(params[:id]).followed
  #   current_user.unfollow!(@user)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   end
  # end

  private

    def set_proof
      @proof = Proof.find(params[:id])
    end

    def proof_params
      params.require(:proof).permit(:competence_id, :organization_profile_id, :state)
    end
end
