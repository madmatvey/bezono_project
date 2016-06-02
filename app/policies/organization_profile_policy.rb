class OrganizationProfilePolicy
  attr_reader :current_user, :organization_profile

  def initialize(current_user, organization_profile)
    @current_user = current_user
    @org_acc = organization_profile
  end
  def index?
    @current_user.try(:admin?)
  end

  def show?
    @current_user.try(:admin?) or @org_acc == @current_user.organization_account.organization_profile
  end

  def edit?
      @current_user.try(:admin?)
  end

  def update?
    @current_user.try(:admin?) or @org_acc == @current_user.organization_account.organization_profile
  end

  def destroy?
    # return false if @current_user == @user
    @current_user.try(:admin?)
  end
  def update?
    @current_user.try(:admin?)
  end
end
