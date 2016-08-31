class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy]

  # GET /demands
  # GET /demands.json
  def index
    @demands = Demand.all
    authorize @demands
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    authorize @demand
  end

  # GET /demands/new
  def new
    @demand = Demand.new
    @competences = Competence.all - @demand.competences
    @criterions = Criterion.all - @demand.criterions
    authorize @demand
  end

  # GET /demands/1/edit
  def edit
    authorize @demand
    @competences = Competence.all - @demand.competences
    @criterions = Criterion.all - @demand.criterions
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Demand.new(demand_params)
    # byebug
    authorize @demand
    # @demand.competences.build(demand_params[:competence_ids])
    respond_to do |format|
      if @demand.save
        @demand.competence_ids = params[:demand][:competence_ids].split(',')
        @demand.criterion_ids = params[:demand][:criterion_ids].split(',')
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
        format.js
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    # byebug
    authorize @demand
    # @demand.competence_ids = params[:demand][:competence_ids].split(',')
    # @demand.competences.build()
    respond_to do |format|
      if @demand.update(demand_params)
        # @demand.competence_ids = params[:demand][:competence_ids].split(',')
        # @demand.criterion_ids = params[:demand][:criterion_ids].split(',')
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    authorize @demand
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, notice: 'Demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:demand).permit(:name, :description, :organization_profile_id, :competence_ids => [] , :criterion_ids => [])
    end
end
