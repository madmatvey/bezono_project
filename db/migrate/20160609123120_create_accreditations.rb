class CreateAccreditations < ActiveRecord::Migration
  def change
    create_table :accreditations do |t|
      t.integer :state
      t.belongs_to :organization_profile, index: true
      t.timestamps null: false
    end
  end
end
