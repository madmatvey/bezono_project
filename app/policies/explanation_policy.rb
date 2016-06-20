class ExplanationPolicy
  attr_reader :current_user, :explanation

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
       @demand = explanation
       @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.where(explanation: explanation)
      end
    end
  end

  def initialize(current_user, explanation)
    @current_user = current_user
    @explanation = explanation
  end

  def index?
    @current_user.try(:admin?) || @current_user.active_profile != nil if @current_user != nil
  end

  def show?
    @current_user.active_profile != nil if @current_user != nil
  end

  def new?
    @current_user.try(:admin?) or @current_user.active_profile.accreditation.state == "supplier" if @current_user != nil && @current_user.active_profile != nil
  end

  def create?
    @current_user.try(:admin?) or @current_user.active_profile.accreditation.state == "supplier" if @current_user != nil && @current_user.active_profile != nil
  end

  def edit?
    @current_user.try(:admin?) or @current_user.active_profile == @explanation.organization_profile if @current_user != nil
  end

  def update?
    @current_user.try(:admin?) or @current_user.active_profile == @explanation.organization_profile if @current_user != nil
  end

  def destroy?
    @current_user.try(:admin?)
  end

end
