class CreateRegionLethality < ActiveRecord::Migration[5.0]
  def change
    create_table :region_lethalities do |t|
      t.references :disease, foreign_key: true
      t.references :province, foreign_key: true
      t.decimal :lethality, :precision => 6, :scale => 3

      t.timestamps
    end
  end
end
