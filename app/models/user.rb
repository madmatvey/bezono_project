class User < ActiveRecord::Base
  enum role: [:user, :operator, :admin, :banned]
  after_initialize :set_default_role, :if => :new_record?
  belongs_to :organization_account

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 8..128
end
