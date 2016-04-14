require 'json'
require 'pry'

class TextToJsonDeckConverter
  def initialize(txt_file_directory)
    @txt_file_paths = Dir.glob(txt_file_directory + '/**/*.txt')
    run
  end

  private

  def run
    @txt_file_paths.each do |txt_file_path|
      base_file_name   = File.basename(txt_file_path, '.txt')
      json_file_path = "../decks/#{base_file_name}.json"
      convert_deck(txt_file_path, json_file_path)
    end
  end

  def convert_deck(txt_file_path, json_file_path)
    initialize_json_deck_file(txt_file_path, json_file_path)

    deck          = json_deck_to_hash(json_file_path)
    new_deck_data = txt_deck_to_hash(txt_file_path)
    new_deck_data.each {|k, v| deck[k] = v}

    File.open(json_file_path, "w") {|file| file.puts  deck.to_json}
  end

  # creates new json deck file if it doesn't already exist
  def initialize_json_deck_file(txt_file_path, json_file_path)
    unless File.exist?(json_file_path)
      blank_deck = {
        "title"       => "",
        "series"      => "",
        "description" => "",
        "black_cards" => [],
        "white_cards" => []
      }

      File.open(json_file_path, "w+") {|file| file.puts blank_deck.to_json}
    end
  end

  def json_deck_to_hash(json_file_path)
    json_deck = File.read(json_file_path)
    JSON.parse(json_deck)
  end

  def txt_deck_to_hash(txt_file_path)
    txt_file = File.open(txt_file_path, "r")

    if black_or_white(txt_file_path) == :black
      parse_black_card_txt_file(txt_file)
    elsif black_or_white(txt_file_path) == :white
      parse_white_card_txt_file(txt_file)
    end
  end

  def parse_black_card_txt_file(txt_file)
    deck_attrs = {"black_cards" => []}

    txt_file.each.with_index do |text, line_number|
      text = text.chomp

      case line_number
      when 0
        deck_attrs["title"]       = text
      when 1
        deck_attrs["series"]      = text
      when 2
        deck_attrs["description"] = text
      # beyond line 2 are all card text lines 
      else
        number_of_blanks = text.scan("______").count
        # the else condition is for questions that end in "?" without a blank
        pick = number_of_blanks > 0 ? number_of_blanks : 1
        draw = pick >= 3 ? pick - 1 : 0
        card =  {
          "text" => text,
          "pick" => pick,
          "draw" => draw
        }
        deck_attrs["black_cards"] << card
      end
    end

    deck_attrs
  end

  def parse_white_card_txt_file(txt_file)
    deck_attrs = {"white_cards" => []}

    txt_file.each.with_index do |text, line_number|
      text = text.chomp

      if line_number == 0
        deck_attrs["title"] = text
      # beyond line 0 are all card text lines 
      else
        card =  {"text" => text}
        deck_attrs["white_cards"] << card
      end
    end

    deck_attrs
  end

  def black_or_white(txt_file_path)
    if txt_file_path.match(/\/black\//)
      :black
    elsif txt_file_path.match(/\/white\//)
      :white
    end
  end
end

TextToJsonDeckConverter.new('../raw_decks/official')