Fabricator(:wow_character) do
  server "Woo'ds"
  name "Big Hunter"
  region :eu
  user { Fabricate(:user) }
end