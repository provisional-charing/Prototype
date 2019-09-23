class CreateProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :provinces do |t|
      t.string :country_name, :unique => false
      t.string :province_name, :unique => true
      t.multi_polygon :geom, :srid => 4326
    end

    change_table :provinces do |t|
      t.index :geom, using: :gist
    end
  end
end
