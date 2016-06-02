class OrganizationAccountPolicy
  attr_reader :current_user, :organization_account

  def initialize(current_user, organization_account)
    @current_user = current_user
    @org_acc = organization_account
  end

  def index?
    @current_user.try(:admin?)
  end

  def show?
    @current_user.try(:admin?) or @org_acc == @current_user.organization_account

  end

  def update?
  @current_user.try(:admin?) or @org_acc == @current_user.organization_account
  end

  def destroy?
    # return false if @current_user == @user
    @current_user.try(:admin?)
  end

end
