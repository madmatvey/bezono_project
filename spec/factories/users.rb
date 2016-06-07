FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end
    association :organization_account, factory: :organization_account, strategy: :build
  end
end
