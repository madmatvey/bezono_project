class DemandPolicy
  attr_reader :current_user, :demand

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

  def initialize(current_user, demand)
    @current_user = current_user
    @demand = demand
  end

  def index?
    @current_user.try(:admin?) || @current_user.active_profile != nil if @current_user != nil
  end

  def show?
    @current_user.active_profile != nil if @current_user != nil
  end

  def new?
    @current_user.active_profile.accreditation.state == "customer" if @current_user != nil && @current_user.active_profile != nil
  end

  def create?
    @current_user.active_profile.accreditation.state == "customer" if @current_user != nil && @current_user.active_profile != nil
  end

  def create_explanations?
    true
    #@current_user.active_profile.accreditation.state == "supplier" && @current_user.organization_account != @demand.organization_profile.organization_account if @current_user != nil && @current_user.active_profile != nil
  end

  def edit?
    true
    #@current_user.try(:admin?) or @current_user.active_profile == @demand.organization_profile if @current_user != nil
  end

  def update?
    true
    @current_user.try(:admin?) or @current_user.active_profile == @demand.organization_profile if @current_user != nil
  end

  def destroy?
    @current_user.try(:admin?)
  end

end
