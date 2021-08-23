class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name , null: false
      t.references :package, foreign_key: true
      t.string :packagename , null: false
      t.timestamps
    end
  end
end
