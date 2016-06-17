class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation, :dependent => :destroy
  after_initialize :set_default_accreditation, :if => :new_record?
  has_many :active_users, class_name: "User",
            foreign_key: "active_profile_id",
            dependent: :nullify

  validates :inn, presence: true, uniqueness: true
  scope :accreditated,  -> { where(accreditated: OrganizationProfile.accreditated) }
  scope :customers, -> {where(customers: true)}


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

  def self.customers
    OrganizationProfile.select {|profile| profile.accreditation.customer?}
  end

  private

    def check_and_nullify_active_profiles_at_user

    end

end
