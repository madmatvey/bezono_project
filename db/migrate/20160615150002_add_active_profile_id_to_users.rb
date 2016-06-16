class AddActiveProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_profile_id, :integer
  end
end
