# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "home," "sign in," and "sign up"
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_content I18n.t('home')
    expect(page).to have_content I18n.t('devise.button.sign_in')
    expect(page).to have_content I18n.t('devise.button.sign_up')
  end

  # scenario 'do something denieds criminal' do
  #   visit new_demand_path
  #   expect(controller).to set_flash[:alert].to(/Access denied./).now
  # end
end
