class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :project, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
