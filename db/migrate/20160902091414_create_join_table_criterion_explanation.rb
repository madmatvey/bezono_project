class CreateJoinTableCriterionExplanation < ActiveRecord::Migration
  def change
    create_join_table :criterions, :explanations do |t|
      t.index :criterion_id
      t.index :explanation_id
    end
  end
end
