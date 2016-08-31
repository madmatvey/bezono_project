class RemoveDemandFromCriterion < ActiveRecord::Migration
  def change
    remove_column :criterions, :demand_id, :integer
  end
end
