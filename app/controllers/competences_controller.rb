class CompetencesController < ApplicationController
  before_action :set_competence, only: [:show, :edit, :update, :destroy]

  # GET /competences
  # GET /competences.json
  def index
    @competences = Competence.all
    authorize @competences
  end

  # GET /competences/1
  # GET /competences/1.json
  def show
    authorize @competence
  end

  # GET /competences/new
  def new
    @competence = Competence.new
    authorize @competence
  end

  # GET /competences/1/edit
  def edit
    @competence = Competence.find(params[:id])
    authorize @competence
  end

  # POST /competences
  # POST /competences.json
  def create
    @competences = Competence.all
    @competence = Competence.new(competence_params)
    authorize @competence
    respond_to do |format|
      if @competence.save
        format.html { redirect_to @competence, notice: 'Competence was successfully created.' }
        format.js { render :show, status: :created, location: @competence }
      else
        format.html { render :new }
        format.js { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competences/1
  # PATCH/PUT /competences/1.json
  def update
    @competences = Competence.all
    authorize @competence
    respond_to do |format|
      if @competence.update(competence_params)
        format.html { redirect_to @competence, notice: 'Competence was successfully updated.' }
        format.js { render :show, status: :ok, location: @competence }
      else
        format.html { render :edit }
        format.js { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1
  # DELETE /competences/1.json
  def destroy
    @competences = Competence.all
    authorize @competence
    @competence.destroy
    respond_to do |format|
      format.html { redirect_to competences_url, notice: 'Competence was successfully destroyed.' }
      format.js { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competence
      @competence = Competence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competence_params
      params.require(:competence).permit(:tag, :organization_profile_id)
    end
end
