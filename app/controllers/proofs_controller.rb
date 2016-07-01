class ProofsController < ApplicationController
    before_action :set_proof, only: [:show, :update, :destroy]


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

  def update

    respond_to do |format|
      if @proof.update(proof_params)
        format.html { redirect_to @proof, notice: 'Proof was successfully updated.' }
        format.json { render :show, status: :ok, location: @proof }
      else
        format.html { render :show }
        format.json { render json: @proof.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_proof
      @proof = Proof.find(params[:id])
    end

    def proof_params
      params.require(:proof).permit(:competence_id, :organization_profile_id, :state)
    end
end
