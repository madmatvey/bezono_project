class CreateJoinTableCriterionDemand < ActiveRecord::Migration
  def change
    create_join_table :criterions, :demands do |t|
      t.index :criterion_id
      t.index :demand_id
    end
  end

end
