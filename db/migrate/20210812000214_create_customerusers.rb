class CreateCustomerusers < ActiveRecord::Migration[5.2]
  def change
    create_table :customerusers do |t|
      t.references :customer, foreign_key: true
      t.string :customername
      t.string :department
      t.string :name  , null: false
      t.string :email , default: ""
      t.string :tel
      t.text :meta

      t.timestamps
    end
  end
end
