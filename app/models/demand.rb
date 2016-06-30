class Demand < ActiveRecord::Base
  belongs_to :organization_profile
  has_many :explanations, :dependent => :destroy
  accepts_nested_attributes_for :explanations
  has_and_belongs_to_many :competences


  def have_explanations_without_answer?
    if self.explanations.map {|expl| expl.answered?}.any?
      true
    else
      false
    end
  end

  def count_of_explanations_without_answers
    self.explanations.map {|expl| expl.answered?}.count(true)
  end


end
