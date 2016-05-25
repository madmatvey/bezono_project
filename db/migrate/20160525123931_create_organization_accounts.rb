class CreateOrganizationAccounts < ActiveRecord::Migration
  def change
    create_table :organization_accounts do |t|
      t.string :name
      # t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    change_table :users do |t|
      t.belongs_to :organization_account, index: true
    end
  end
end
