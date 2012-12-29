Fabricator(:wow_character) do
  server "Woo'ds"
  name "Big Hunter"
  region :eu
  user { Fabricate(:user) }
end

Fabricator(:wot_character) do
  account_id "123456"
  name "TheDriver"
  region :world
  user { Fabricate(:user) }
end