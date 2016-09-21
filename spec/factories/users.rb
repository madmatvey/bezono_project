FactoryGirl.define do
  sequence :name do |n|
    "#{Faker::Name.name}#{n}"
  end

  sequence :email do |n|
    "#{Faker::Internet.email}"
  end

  sequence :password do |n|
    "#{Faker::Internet.password(8)}"
  end

  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password { generate(:password) }

    trait :admin do
      role 'admin'
    end
    organization_account
  end
end
