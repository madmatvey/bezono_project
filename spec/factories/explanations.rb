FactoryGirl.define do
  sequence :message do |n|
    "#{Faker::Lorem.sentence} №#{n}"
  end

  factory :explanation do
    message { generate(:message) }
    user
    demand
    organization_profile
  end
end
