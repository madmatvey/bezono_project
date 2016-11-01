class Explanation < ApplicationRecord
  after_create_commit { ExplanationBroadcastJob.perfom_later self }
  belongs_to :user
  belongs_to :demand
  belongs_to :organization_profile

  belongs_to :question, class_name: 'Explanation', foreign_key: 'question_id'
  has_one :answer, class_name: 'Explanation', foreign_key: 'question_id'
  has_many :new_explanation_notif, as: :target, dependent: :destroy
  has_and_belongs_to_many :criterions, autosave: true

  validates :organization_profile_id, presence: true
  validates :user_id, presence: true
  validates :demand_id, presence: true
  validates :message, presence: true

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

  def self.to_react(demand)
    array = []
    demand.explanations.each {|exp| array.push(exp.as_json(
      only: [ # permitted data to react
        :id,
        :message,
        :user_id,
        :demand_id,
        :organization_profile_id,
        :question_id]
        ).merge({  # permitted methods results to react
          "from" => exp.organization_profile.accreditation.state,
          "answer_id" => exp.answer.try(:id)
          }))}
    array
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
    act_users = active_organizations.map { |org| org.active_users }.flatten.uniq - [self.user]
    act_users.map { |act_user| NewExplanationNotif.create(target: self, user: act_user) }
  end
end
