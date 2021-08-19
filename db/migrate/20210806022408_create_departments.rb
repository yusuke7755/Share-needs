class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name  , null: false
      t.boolean :web_flg      , default: false ,null: false
      t.timestamps
    end
  end
end
