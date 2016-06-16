class OrganizationAccountPolicy
  attr_reader :current_user, :organization_account

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
       @user = user
       @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def initialize(current_user, organization_account)
    @current_user = current_user
    @org_acc = organization_account
  end

  def index?
    @current_user.try(:admin?)
  end

  def new?
    @current_user.try(:admin?)
  end

  def create?
    @current_user.try(:admin?)
  end


  def show?
    @current_user.try(:admin?) or @org_acc == @current_user.organization_account
  end

  def edit?
      @current_user.try(:admin?)
  end

  def update?
  @current_user.try(:admin?)
  end

  def destroy?
    @current_user.try(:admin?)
  end

end
