class Proof < ActiveRecord::Base
  belongs_to :organization_profile
  belongs_to :competence
  validates :competence_id, presence: true
  validates :organization_profile_id, presence: true

  after_initialize :set_default_state, :if => :new_record?

  enum state: {
    wonnabe: 0,
    approved: 1,
    expired: 666
  }

  def set_default_state
    self.state ||= :wonnabe
  end
end
