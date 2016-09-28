module Features
  module SessionHelpers
    def sign_up_with(name, email, password, confirmation)
      visit new_user_registration_path
      fill_in I18n.t('simple_form.labels.defaults.email'), with: email, match: :prefer_exact
      fill_in I18n.t('simple_form.labels.defaults.name'), with: name, match: :prefer_exact
      # select  Rails.application.secrets.demo_account, from: 'user_organization_account_id'
      fill_in I18n.t('simple_form.labels.defaults.password'), with: password, match: :prefer_exact
      fill_in I18n.t('simple_form.labels.user.password_confirmation'), with: confirmation, match: :prefer_exact
      click_button I18n.t('devise.button.sign_up')
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in I18n.t('simple_form.labels.defaults.email'), with: email, match: :prefer_exact
      fill_in I18n.t('simple_form.labels.defaults.password'), with: password, match: :prefer_exact
      click_button I18n.t('devise.button.sign_in')
    end
  end
end
