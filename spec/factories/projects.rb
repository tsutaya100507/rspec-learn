FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "Sample project for testing purposes"
    due_on 1.week.from_now
    association :owner

    factory :project_due_yesterday, class: Project do
      due_on 1.day.ago
    end

    factory :project_due_today, class: Project do
      due_on Date.current.in_time_zone
    end

    factory :project_due_tomorrow, class: Project do
      due_on 1.day.from_now
    end

    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project)}
    end
  end
end
