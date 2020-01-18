FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "Aaron"
    last_name "Summer"
    sequence(:email) { |n| "tetster#{n}@example.com" }
    password "aaaaaaaaaaaaaaa"
  end
end
