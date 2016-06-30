class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.integer :state
      t.references :organization_profile, index: true, foreign_key: true
      t.references :competence, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :proofs, [:organization_profile_id, :competence_id], unique: true
  end
end
