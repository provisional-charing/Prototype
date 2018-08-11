class CreateVaccinationCards < ActiveRecord::Migration[5.0]
  def change
    create_table :vaccination_cards do |t|
      t.references :vaccination, foreign_key: true
      t.references :user, foreign_key: true
      t.date :get_date
      t.int :injection_type
      t.double :dosis_e
      t.double :dosis_ml
      t.string :typ
      t.string :charge_number
      t.string :doctor
      t.string :test
      t.string :reaktion

      t.timestamps
    end
  end
end
