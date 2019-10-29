class RegionLethality < ApplicationRecord

  def get_regions(max)
    RegionLethality.find_each(:lethality <= max, :lethality>0 ).pluck(:province_id)
  end
end