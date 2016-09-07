class ExplanationsController < ApplicationController
  before_action :set_explanation, only: [:show, :edit, :update, :destroy]

  # GET /explanations
  # GET /explanations.json
  def index
    @demand = Demand.find(params[:demand_id])
    @explanations = @demand.explanations
    @explanation = @demand.explanations.build
    authorize @explanations
  end

  # GET /explanations/1
  # GET /explanations/1.json
  def show
    @explanation = @demand.explanations.find(params[:id])
    authorize @explanation
  end

  # GET /explanations/new
  def new
    @demand = Demand.find(params[:demand_id])
    @explanation = @demand.explanations.build
    authorize @explanation
  end

  # GET /explanations/1/edit
  def edit
    authorize @explanation
  end

  # POST /explanations
  # POST /explanations.json
  def create
    @demand = Demand.find(params[:demand_id])
    @explanation = @demand.explanations.build(explanation_params)
    # authorize @demand.organization_profile
    respond_to do |format|
      if @explanation.save
        # @explanation.criterion_ids = params[:explanation][:criterion_ids].first.split(',')
        format.html { redirect_to demand_path(id: params[:demand_id]), notice: 'Explanation was successfully created.' }
        format.json { render :show, status: :created, location: @explanation }
      else
        format.html { render :new }
        format.json { render json: @explanation.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /explanations/1
  # PATCH/PUT /explanations/1.json
  def update
    authorize @explanation
    respond_to do |format|
      if @explanation.update(explanation_params)
        # @explanation.criterion_ids = params[:explanation][:criterion_ids].first.split(',')
        format.html { redirect_to @explanation, notice: 'Explanation was successfully updated.' }
        format.json { render :show, status: :ok, location: @explanation }
      else
        format.html { render :edit }
        format.json { render json: @explanation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explanations/1
  # DELETE /explanations/1.json
  def destroy
    authorize @explanation
    @explanation.destroy
    respond_to do |format|
      format.html { redirect_to explanations_url, notice: 'Explanation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explanation
      @explanation = Explanation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explanation_params
      params.require(:explanation).permit(:message, :user_id, :demand_id, :organization_profile_id, :question_id, :criterion_ids => [])
    end
end
