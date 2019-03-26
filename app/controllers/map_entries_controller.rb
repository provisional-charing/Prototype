class MapEntriesController < ApplicationController
  before_action :set_map_entry, only: [:show, :edit, :update, :destroy]

  # GET /map_entries
  # GET /map_entries.json
  def index
    @map_entries = MapEntry.all
  end

  # GET /map_entries/1
  # GET /map_entries/1.json
  def show
  end

  # GET /map_entries/new
  def new
    @map_entry = MapEntry.new
  end

  # GET /map_entries/1/edit
  def edit
  end

  # POST /map_entries
  # POST /map_entries.json
  def create
    @map_entry = MapEntry.new(map_entry_params)

    respond_to do |format|
      if @map_entry.save
        format.html { redirect_to @map_entry, notice: 'Map entry was successfully created.' }
        format.json { render :show, status: :created, location: @map_entry }
      else
        format.html { render :new }
        format.json { render json: @map_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /map_entries/1
  # PATCH/PUT /map_entries/1.json
  def update
    respond_to do |format|
      if @map_entry.update(map_entry_params)
        format.html { redirect_to @map_entry, notice: 'Map entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @map_entry }
      else
        format.html { render :edit }
        format.json { render json: @map_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_entries/1
  # DELETE /map_entries/1.json
  def destroy
    @map_entry.destroy
    respond_to do |format|
      format.html { redirect_to map_entries_url, notice: 'Map entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map_entry
      @map_entry = MapEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_entry_params
      params.require(:map_entry).permit(:name, :plz, :location, :street, :phone, :spec, :lat, :lng)
    end
end
