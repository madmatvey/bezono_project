class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.text :message
      t.references :user, index: true, foreign_key: true
      t.references :demand, index: true, foreign_key: true
      t.references :organization_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
