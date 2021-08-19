class CreateProjectusers < ActiveRecord::Migration[5.2]
  def change
    create_table :projectusers do |t|
      t.references :project, foreign_key: true
      t.references :customeruser, foreign_key: true

      t.timestamps
    end
  end
end
