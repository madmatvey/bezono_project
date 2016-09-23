class Demand < ActiveRecord::Base
  belongs_to :organization_profile
  has_many :explanations, :dependent => :destroy
  accepts_nested_attributes_for :explanations
  has_and_belongs_to_many :competences, autosave: true
  has_and_belongs_to_many :criterions, autosave: true


  def have_explanations_without_answer?
    if self.explanations.map {|expl| expl.answered?}.any?
      false
    else
      true
    end
  end

  def count_of_explanations_without_answers
    self.explanations.map {|expl| expl.answered?}.count(false)
  end
end
