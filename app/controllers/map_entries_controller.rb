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
    typ = params[:typ]
    search = params[:search]
    coords = params[:coords]
    case typ
    when 0
      return MapEntry.all.where(spec: search.spec).to_json
    when 1
          a=[]
          @map_entries = MapEntry.all
          @map_entries.each do |e|
            point1 = [e.lat, e.lng]
            point2 = [coords.x, coords.y]
            dist = calc_distance(point1,point2)
            if dist <= search.dist
              a << e
            end
          end
          a.to_json
    else
      return ''
    end
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

    def calc_distance(point1, point2)
      r = 6371
      x1, y1 = coords_to_rads(point1)
      x2, y2 = coords_to_rads(point2)
      dx = x1 - x2
      dy = y1 - y2

      a = Math.sin(dx/2)**2 + Math.cos(x1) * Math.cos(x2) * Math.sin(dy/2)**2
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      r * c
    end

    def coords_to_rads (point)
      if point.length == 2
        if point[0].is_a? Numeric
          x = point[0]
        elsif point[0].is_a? String # cd cardinal direction, d degree, m minutes, s seconds
          d, m, s, cd = point[0].scan(COORD_PARSE_REGEX)
          x = radians(int(d) + int(m)/60 + int(s)/3600)
          if cd=='S' || cd=='W'
            x*=-1
          end
        else
          x = 0
        end

        if point[1].is_a? Numeric
          y = point[1]
        elsif point[1].is_a? String # cd cardinal direction, d degree, m minutes, s seconds
          d, m, s, cd = point[1].scan(COORD_PARSE_REGEX)
          y = radians(int(d) + int(m)/60 + int(s)/3600)
          if cd=='S' || cd=='W'
            y*=-1
          end
        else
          y = 0
        end
        return x,y
      else
        return 0,0
      end
    end

    def radians (degrees)
      degrees * Math::PI / 180
    end
end
