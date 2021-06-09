FactoryBot.define do
  factory :user do
    email { "shubhamsuhbham@test.com" }
    password { 'wooyeahhhh' }

    trait :tasks do
      title { "Some Title" }
      notes { "New Notes" }
      end_date { DateTime.now + 10.days }
    end

  end
end
