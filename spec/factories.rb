FactoryGirl.define do
  factory :user do
    provider "test"
    sequence(:uid) { |n| "uid_#{n}" }
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    factory :admin do
      # note: i dont know if this assignment works
      add_role :admin
    end
  end
end