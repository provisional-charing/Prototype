class RegionLethalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region_lethality, only: [:show, :edit, :update, :destroy]
  before_action :check_classification_doc, only: [:index, :new, :edit, :create, :update, :destroy]

  # GET /region_lethalities
  # GET /region_lethalities.json
  def index
    @region_lethalities = RegionLethality.all
  end

  # GET /region_lethalities/new
  def new
    @region_lethality = RegionLethality.new
  end

  # GET /region_lethalities/1/edit
  def edit
  end

  # POST /region_lethalities
  # POST /region_lethalities.json
  def create
    @region_lethality = RegionLethality.new(region_lethality_params)

    respond_to do |format|
      if @region_lethality.save
        format.html { redirect_to region_lethalities_path, notice: 'Region lethality was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @region_lethality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /region_lethalities/1
  # PATCH/PUT /region_lethalities/1.json
  def update
    respond_to do |format|
      if @region_lethality.update(region_lethality_params)
        format.html { redirect_to @region_lethality, notice: 'RegionLethality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @region_lethality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /region_lethalities/1
  # DELETE /region_lethalities/1.json
  def destroy
    @region_lethality.destroy
    respond_to do |format|
      format.html { redirect_to region_lethalities_path }
      format.json { head :no_content }
    end
  end

  def wikiMain_page
    @region_lethalitys = RegionLethality.all.order(:name)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_region_lethality
    @region_lethality = RegionLethality.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def region_lethality_params
    params.require(:region_lethality).permit(:disease_id, :province_id, :lethality)
  end

end