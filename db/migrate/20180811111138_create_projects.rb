class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.text :project_name
      t.date :begin
      t.integer :e_duration
      t.text :s_description
      t.text :description
      t.text :aim
      t.text :target_group
      t.integer :financial_support_needed

      t.timestamps
    end
  end
end
