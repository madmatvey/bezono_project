class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      
      t.references :demand, index: true, foreign_key: true
      t.references :organization_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
