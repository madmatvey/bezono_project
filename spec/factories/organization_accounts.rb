FactoryGirl.define do
  sequence :account_name do |n|
    "#{Faker::Internet.domain_name}_account#{n}"
  end

  factory :organization_account do
    # name
    name { generate(:account_name) }

    factory :account_with_users do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        users_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after :create do |organization_account, evaluator|
        organization_account.users << FactoryGirl.build_list(:users, evaluator.users_count, organization_account: nil)
      end
      after :build do |organization_account, evaluator|
        organization_account.users << FactoryGirl.build_list(:users, evaluator.users_count, organization_account: nil)
      end
    end

    factory :account_with_profiles do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        organization_profiles_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |organization_account, evaluator|
        create_list(:organization_profile, evaluator.organization_profiles_count, organization_account: organization_account)
      end
    end
  end
end
