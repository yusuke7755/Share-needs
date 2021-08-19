class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title , null: false
      t.references :customer, foreign_key: true , null: false
      t.references :package, foreign_key: true , null: false
      t.text :description , null: false
      t.date :apoint_at , null: false
      t.references :department, foreign_key: true , null: false
      t.references :employee, foreign_key: true , null: false
      t.date :deadline
      t.integer :priority

      t.timestamps
    end
  end
end
