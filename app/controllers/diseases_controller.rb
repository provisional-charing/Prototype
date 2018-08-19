class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]
  before_action :check_classification_doc, only: [:index, :new, :edit, :create, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @diseases = Disease.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @disease = Disease.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @disease = Disease.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to @disease, notice: 'Disease was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disease }
      else
        format.html { render action: 'new' }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to @disease, notice: 'Disease was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url }
      format.json { head :no_content }
    end
  end

  def wikiMain_page
    @diseases = Disease.all.order(:name)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_disease
    @disease = Disease.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disease_params
    params.require(:diseases).permit(:name)
  end

end