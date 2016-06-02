FactoryGirl.define do
  factory :organization_account do
    name "demo_account"
    association :organization_profile, factory: :organization_profile, inn: "321654987"
  end
end
