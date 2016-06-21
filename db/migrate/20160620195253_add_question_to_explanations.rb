class AddQuestionToExplanations < ActiveRecord::Migration
  def change
    add_column :explanations, :question_id, :integer, default: nil
    add_index :explanations, :question_id
  end
end
