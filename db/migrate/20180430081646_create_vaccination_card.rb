class CreateVaccinationCard < ActiveRecord::Migration[5.0]
  def change
    create_table :vaccination_cards do |t|
      t.references :user

    end
  end
end
