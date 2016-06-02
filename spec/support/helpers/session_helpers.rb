module Features
  module SessionHelpers
    def sign_up_with(name, email, password, confirmation)
      visit new_user_registration_path
      fill_in I18n.t('simple_form.labels.defaults.name'), with: name
      fill_in I18n.t('simple_form.labels.defaults.email'), with: email
      fill_in I18n.t('simple_form.labels.defaults.password'), with: password
      fill_in I18n.t('simple_form.labels.user.password_confirmation'), with: confirmation
      click_button I18n.t('devise.button.sign_up')
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in I18n.t('simple_form.labels.defaults.email'), with: email
      fill_in I18n.t('simple_form.labels.defaults.password'), with: password
      click_button I18n.t('devise.button.sign_in')
    end
  end
end
