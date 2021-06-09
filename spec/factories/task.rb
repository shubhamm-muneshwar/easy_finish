FactoryBot.define do
  factory :task do
    title { "Some Title" }
    notes { "New Notes" }
    end_date { DateTime.now + 10.days }

    trait :user do
      email { "shubhamsuhbham@test.com" }
      password { 'wooyeahhhh' }
    end

    trait :task_status do
      status { 'Backlog' }
    end

  end
end
