class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :name
      t.text :description
      t.belongs_to :organization_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
