Fabricator(:user) do
  provider "a test provider"
  uid { sequence(:uid) { |n| "uid_#{n}" } }
  name { sequence(:name)  { |n| "Person #{n}" } }
  email { sequence(:email) { |n| "person_#{n}@example.com"} }
end