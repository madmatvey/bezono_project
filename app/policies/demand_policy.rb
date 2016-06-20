class DemandPolicy
  attr_reader :current_user, :demand

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
       @demand = demand
       @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.where(demand: demand)
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

  def edit?
    @current_user.try(:admin?) or @current_user.active_profile == @demand.organization_profile if @current_user != nil
  end

  def update?
    @current_user.try(:admin?) or @current_user.active_profile == @demand.organization_profile if @current_user != nil
  end

  def destroy?
    @current_user.try(:admin?)
  end

end
