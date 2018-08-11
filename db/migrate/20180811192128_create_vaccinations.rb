class CreateVaccinations < ActiveRecord::Migration[5.0]
  def change
    create_table :vaccinations do |t|
      t.references :disease, foreign_key: true
      t.integer :duration
      t.text :e_information

      t.timestamps
    end
  end
end
