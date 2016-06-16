class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation, :dependent => :destroy
  after_initialize :set_default_accreditation, :if => :new_record?
  validates :inn, presence: true, uniqueness: true
  scope :accreditated,  -> { where(accreditated: OrganizationProfile.accreditated) }

  def set_default_accreditation
    self.accreditation ||= Accreditation.create
  end

  def accreditated?
    if self.accreditation.verified?
      true
    else
      false
    end
  end

  def self.accreditated
    OrganizationProfile.select {|profile| profile.accreditated?}
  end

end
