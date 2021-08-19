class CreateProjectmembers < ActiveRecord::Migration[5.2]
  def change
    create_table :projectmembers do |t|
      t.references :project, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
