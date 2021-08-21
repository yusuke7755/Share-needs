class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :department, null: false
      t.references :employee, foreign_key: true , null: false
      t.string :customer , null: false
      t.references :customeruser, foreign_key: true , null: false
      t.string :package, null: false
      t.references :feature, foreign_key: true , null: false
      t.date :apoint_at, null: false
      t.date :deadline
      t.text :description, null: false
      t.integer :priority

      t.timestamps
    end
  end
end
