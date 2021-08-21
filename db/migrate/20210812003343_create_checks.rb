class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :employee, foreign_key: true , null: false
      t.string :customername, null: false
    end
  end
end
