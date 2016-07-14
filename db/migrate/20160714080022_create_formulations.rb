class CreateFormulations < ActiveRecord::Migration
  def change
    create_table :formulations do |t|
      t.references :problem, index: true, foreign_key: true, null: false
      t.references :formulation, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
