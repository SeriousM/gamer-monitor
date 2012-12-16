Fabricator(:character) do
end

Fabricator(:wow_character, from: :character) do
  server "a server"
  name "character name"
end