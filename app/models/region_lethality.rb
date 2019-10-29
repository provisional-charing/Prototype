class RegionLethality < ApplicationRecord

  def self.get_regions(max)
    RegionLethality.where('lethality <= ? AND lethality > 0', max ).pluck(:province_id)
  end
end