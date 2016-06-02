class  Users::RegistrationsController < Devise::RegistrationsController
  # Because of Rails strong parameter we need to use the Registration controller Override
  # to sanitize inputs
  # Devise automatically knows wich one to use
  def new
    build_resource({})
    self.resource.organization_account = OrganizationAccount.new
    respond_with self.resource
  end

  def edit
    @user = User.find(current_user.id)
    @organization_account = @user.organization_account
  end

  def create
    @user = User.new(sign_up_params)

    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

  end

  def show
    super
  end

  def update
    super
  end



private
  def sign_up_params
  params.require(:user).permit(:name, :email, :password,:password_confirmation,
  :organization_account_id)
  end

  def account_update_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation, :current_password,
    :organization_account_id)
  end

protected
  def after_update_path_for(resource)
    user_path(resource)
  end
end
