class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |usr|
      usr.password = Rails.application.secrets.admin_password
      usr.password_confirmation = Rails.application.secrets.admin_password
      usr.name = "Seed Admin User"
      usr.admin!
    end
  end
end
