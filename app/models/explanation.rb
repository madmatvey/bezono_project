class Explanation < ActiveRecord::Base
  belongs_to :user
  belongs_to :demand
  belongs_to :organization_profile

  def account
    self.demand.organization_profile.organization_account
  end

end
