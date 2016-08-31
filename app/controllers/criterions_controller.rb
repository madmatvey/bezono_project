class CriterionsController < ApplicationController
  before_action :set_criterion, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json
  # GET /criterions
  # GET /criterions.json
  def index
    @criterions = Criterion.all
    # authorize @criterions
  end

  # GET /criterions/1
  # GET /criterions/1.json
  def show
    # authorize @criterion
  end

  # GET /criterions/new
  def new
    @criterion = Criterion.new
    # authorize @criterion
    respond_modal_with @criterion
  end

  # GET /criterions/1/edit
  def edit
    @criterion = Criterion.find(params[:id])
    # authorize @criterion
  end

  # POST /criterions
  # POST /criterions.json
  def create
    @criterions = Criterion.all
    @criterion = Criterion.create(criterion_params)
    # authorize @criterion
    respond_modal_with @criterion, location: edit_demand_path(id: @criterion.demands.last.id)
    # respond_to do |format|
    #   if @criterion.save
    #     format.html { redirect_to @criterion, notice: 'Criterion was successfully created.' }
    #     format.js
    #     format.json { render :show, status: :created, location: @criterion }
    #   else
    #     format.html { render :new }
    #     format.js
    #     format.json { render json: @criterion.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /criterions/1
  # PATCH/PUT /criterions/1.json
  def update
    @criterions = Criterion.all
    # authorize @criterion
    respond_to do |format|
      if @criterion.update(criterion_params)
        format.html { redirect_to @criterion, notice: 'Criterion was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @criterion }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterions/1
  # DELETE /criterions/1.json
  def destroy
    @criterions = Criterion.all
    # authorize @criterion
    @criterion.destroy
    respond_to do |format|
      format.html { redirect_to criterions_url, notice: 'Criterion was successfully destroyed.' }
      format.js # { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterion
      @criterion = Criterion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterion_params
      params.require(:criterion).permit(:name, :master_criterion_id, :demand_ids => [])
    end
end
