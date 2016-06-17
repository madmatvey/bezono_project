class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :active_profile_id
  end
end
