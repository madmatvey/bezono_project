FactoryGirl.define do
  factory :explanation do
    message "MyText"
    user
    demand
    organization_profile 
  end
end
