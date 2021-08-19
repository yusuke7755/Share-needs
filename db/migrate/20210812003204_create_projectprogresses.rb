class CreateProjectprogresses < ActiveRecord::Migration[5.2]
  def change
    create_table :projectprogresses do |t|
      t.references :project, foreign_key: true
      t.references :employee, foreign_key: true
      t.datetime :apoint_at , null: false
      t.text :description , null: false

      t.timestamps
    end
  end
end
