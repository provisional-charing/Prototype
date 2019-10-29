class ProvincesController < ApplicationController

  def index
    @provinces = Province.all

    respond_to do |format|
      format.json do
        feature_collection = Province.to_feature_collection @provinces
        render json: RGeo::GeoJSON.encode(feature_collection)
      end

      format.html
    end
  end

  # ids deefine which should be returned
  def matching_indices
    ids = RegionLethality.get_regions(params[:max])
    @provinces = Province.where(id: ids)

    respond_to do |format|
      format.json do
        feature_collection = Province.to_feature_collection @provinces
        render json: RGeo::GeoJSON.encode(feature_collection)
      end

      format.html
    end
  end

end