require 'json'
require 'pry'
decks_directory = File.expand_path('db/decks')

Dir["#{decks_directory}/*.json"].each do |file_name|
  puts file_name
  file      = File.read(file_name)
  deck_data = JSON.parse(file)

  deck = Deck.create(
    official:    deck_data["series"] == "Official",
    title:       deck_data["title"],
    series:      deck_data["series"],
    description: deck_data["description"]
  )

  deck_data["black_cards"].each do |black_card|
    deck.cards.create(
      color: "black",
      text:  black_card["text"],
      pick:  black_card["pick"],
      draw:  black_card["draw"]
    )
  end

  deck_data["white_cards"].each do |white_card|
    deck.cards.create(
      color: "white",
      text:  white_card["text"]
    )
  end
end
