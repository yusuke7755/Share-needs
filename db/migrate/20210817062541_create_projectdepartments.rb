class CreateProjectdepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :projectdepartments do |t|
      t.references :project, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end