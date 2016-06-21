class Explanation < ActiveRecord::Base
  belongs_to :user
  belongs_to :demand
  belongs_to :organization_profile

  belongs_to :question, class_name: 'Explanation', foreign_key: 'question_id'
  has_one :answer, class_name: 'Explanation', foreign_key: 'question_id'

  scope :answered,  -> { where(verified: Explanation.answered) }

  def account
    self.demand.organization_profile.organization_account
  end

  def answered?
    if self.question != nil
      true
    else
      false
    end
  end

  def self.answered
    Explanation.select {|expl| expl.answered?}
  end

end
