class User < ActiveRecord::Base
  enum role: [:user, :operator, :admin, :banned]
  after_initialize :set_default_role, :set_default_account, :if => :new_record?
  belongs_to :organization_account
  accepts_nested_attributes_for :organization_account
  belongs_to :active_profile, class_name: "OrganizationProfile",
                        foreign_key: "active_profile_id"
  before_save :nullify_active_profile, if: :organization_account_id_changed?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, password_length: 8..128
  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :email, presence: true, uniqueness: true

  def set_default_role
    self.role ||= :user
  end

  def set_default_account
    self.organization_account ||= OrganizationAccount.find_or_create_by(name: Rails.application.secrets.demo_account)
  end

  # def active_profile
  #   if self.active_profile_id && self.organization_account == OrganizationProfile.find(self.active_profile_id).organization_account
  #     return OrganizationProfile.find(self.active_profile_id)
  #   else
  #     profiles = self.organization_account.organization_profiles.accreditated
  #     count = profiles.count
  #     if count == 0
  #       return nil
  #     else #if self.active_profile_id == nil
  #       self.active_profile = profiles.first
  #       self.save
  #       return profiles.first
  #     # else
  #     #   return nil
  #     end
  #   end
  # end

  # def active_profile= (organization_profile)
  #   self.active_profile_id = organization_profile.id
  # end

  def profiles
    self.organization_account.organization_profiles
  end

  private
  def nullify_active_profile
    self.active_profile = nil
  end

end
