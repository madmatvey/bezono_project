class User < ActiveRecord::Base
  enum role: [:user, :operator, :admin, :banned]
  after_initialize :set_default_role, :set_default_account, :if => :new_record?
  belongs_to :organization_account
  accepts_nested_attributes_for :organization_account


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, password_length: 8..128
  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :email, presence: true, uniqueness: true;

  def set_default_role
    self.role ||= :user
  end

  def set_default_account
    self.organization_account ||= OrganizationAccount.find_or_create_by(name: Rails.application.secrets.demo_account)
  end

end
