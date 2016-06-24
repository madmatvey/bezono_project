class Explanation < ActiveRecord::Base
  belongs_to :user
  belongs_to :demand
  belongs_to :organization_profile

  belongs_to :question, class_name: 'Explanation', foreign_key: 'question_id'
  has_one :answer, class_name: 'Explanation', foreign_key: 'question_id'
  has_many :new_explanation_notif, as: :target, dependent: :destroy

  scope :answered,  -> { where(verified: Explanation.answered) }

  def account
    self.demand.organization_profile.organization_account
  end

  def answered?
    if self.answer != nil
      true
    else
      false
    end
  end

  def self.answered
    Explanation.select {|expl| expl.answered?}
  end

  def from_supplier?
    self.organization_profile.accreditation.state == "supplier"
  end

  def from_customer?
    self.organization_profile.accreditation.state == "customer"
  end

  after_commit :create_notifications, on: [:create]
  def create_notifications
    active_organizations = self.demand.explanations.map {|expl| expl.organization_profile}
    active_organizations.push(self.demand.organization_profile)
    act_users = active_organizations.map { |org| org.active_users }.flatten.uniq
    act_users.map { |act_user| NewExplanationNotif.create(target: self, user: act_user) }
  end
end
