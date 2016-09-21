FactoryGirl.define do
  factory :accreditation do
    trait :zero do
      state 'zero'
    end
    trait :expired do
      state 'expired'
    end
    trait :supplier do
      state 'supplier'
    end
    trait :customer do
      state 'customer'
    end
    trait :partner do
      state 'partner'
    end

  end
end
