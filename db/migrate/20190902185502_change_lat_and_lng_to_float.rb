class ChangeLatAndLngToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :map_entries, :lat, 'float USING CAST(lat AS float)'
    change_column :map_entries, :lng, 'float USING CAST(lng AS float)'
  end
end
