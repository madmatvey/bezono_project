class UserPolicy
  attr_reader :current_user, :user


  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    @current_user.try(:admin?) or @current_user == @user
  end

  def show?
    @current_user.try(:admin?) or @current_user == @user
  end

  def update?
    @current_user.try(:admin?) or @current_user == @user
  end

  def destroy?
    return false if @current_user == @user
    @current_user.try(:admin?)
  end

end
