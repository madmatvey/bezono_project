class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :tag

      t.timestamps null: false
    end
    create_table :competences_demands, id: false do |t|
      t.belongs_to :competence, index: true
      t.belongs_to :demand, index: true
    end
  end
end
