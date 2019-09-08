module Searchtype
  SPEC = 1
  DISTANCE = 2
end

class MapEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_classification_admin
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

  def search
    # right now implemented spec as 0 and distance as 1
    typ          = params[:typ].to_i
    search       = params[:search]
    coords       = params[:coords]
    where_params = {}
    list = []

    if typ & Searchtype::SPEC != 0
      where_params[:spec] = search[:spec]
    end


    if !where_params.empty?
      @map_entries = MapEntry.all.where(where_params);
    else
      @map_entries = MapEntry.all
    end

    if typ & Searchtype::DISTANCE != 0
      xp, yp = coords_to_rads([coords[:x].to_f, coords[:y].to_f])
      @map_entries.each do |e|
        xt, yt = coords_to_rads( [e.lat, e.lng] )
        dist = calc_distance(xt, yt, xp, yp)
        if dist <= search[:dist].to_f
          list << e.attributes.except("created_at", "updated_at").values
        end
      end
    else
      @map_entries.each do |e|
        list << e.attributes.except("created_at", "updated_at").values
      end
    end

    json_data = list.to_json

    render plain: json_data
  end

  private
    COORD_PARSE_REGEX = /(\d+)°(\d+)′(\d+)″([NSEW])/
    # Use callbacks to share common setup or constraints between actions.
    def set_map_entry
      @map_entry = MapEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_entry_params
      params.require(:map_entry).permit(:name, :plz, :location, :street, :phone, :spec, :lat, :lng)
    end

    def calc_distance(x1, y1, x2, y2)
      r = 6371
      dx = x1 - x2
      dy = y1 - y2

      a = Math.sin(dx/2)**2 + Math.cos(x1) * Math.cos(x2) * Math.sin(dy/2)**2
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      r * c
    end

    def coords_to_rads (point)
      pc =[0,0]
      if point.length == 2
          point.each_with_index { |value, index|
            if value.is_a? Numeric
              pc[index] = radians(value)
            elsif value.is_a? String # cd cardinal direction, d degree, m minutes, s seconds
              d, m, s, cd = value.scan(COORD_PARSE_REGEX)
              pc[index] = radians(d.to_i + m.to_i/60 + s.to_i/3600)
              if cd=='S' || cd=='W'
                pc[index]*=-1
              end
            else
              pc[index] = 0
            end
          }
      end
      pc
    end

    def radians (degrees)
      degrees * Math::PI / 180
    end
end
