class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @organization_account = @user.organization_account(params[:organization_account])
    if @user.update_attributes(secure_params)
      if secure_params[:active_profile_id] != nil
        redirect_to :back
      else
        redirect_to users_path, :notice => "User updated."
      end
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:name, :role, :organization_account_id, :organization_account_name, :active_profile_id)
  end

end
