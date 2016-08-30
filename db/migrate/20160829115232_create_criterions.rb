class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.string :name, null: false
      t.references :demand, index: true, foreign_key: true
      t.integer :master_criterion_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
