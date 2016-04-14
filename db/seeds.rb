require 'json'

Dir['decks/*.json'].each do |file_name|
  file = File.read(file_name)
  deck = JSON.parse(file)

  Deck.create(deck)
end
