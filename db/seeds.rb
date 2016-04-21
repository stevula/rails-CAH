require 'json'

decks_directory = File.expand_path('db/decks')

Dir["#{decks_directory}/*.json"].each do |file_name|
  puts "File: #{file_name}"

  file      = File.read(file_name)
  deck_data = JSON.parse(file)

  deck = Deck.create!(
    official:    deck_data["series"] == "Official",
    title:       deck_data["title"],
    series:      deck_data["series"],
    description: deck_data["description"]
  )

  deck_data["black_cards"].each do |black_card|
    puts "  Black card: #{black_card}"

    deck.cards.create!(
      type: "BlackCard",
      text:  black_card["text"],
      pick:  black_card["pick"],
      draw:  black_card["draw"]
    )
  end

  deck_data["white_cards"].each do |white_card|
    puts "  White card: #{white_card}"
    
    deck.cards.create!(
      type: "WhiteCard",
      text:  white_card["text"]
    )
  end
end
