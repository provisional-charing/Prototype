class CreateMapEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :map_entries do |t|
      t.string :name
      t.string :plz
      t.string :location
      t.string :street
      t.string :phone
      t.string :spec
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
