class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.text :title
      t.text :content
      t.datetime :remember_date

      t.timestamps
    end
  end
end
