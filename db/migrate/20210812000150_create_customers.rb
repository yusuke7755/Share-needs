class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name  , null: false
      t.string :address , null: false
      t.string :tel , null: false
      t.boolean :user_flg     , default: false ,null: false

      t.timestamps
    end
  end
end
