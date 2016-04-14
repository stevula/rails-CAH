require 'json'
require 'pry'

class TextToJsonDeckConverter
  def initialize(input_directory_path)
    @txt_file_paths = Dir.glob(input_directory_path + '/**/*.txt')
    run
  end

  private

  def run
    @txt_file_paths.each do |input_file_path|
      base_file_name   = File.basename(input_file_path, '.txt')
      output_file_name = "../decks/#{base_file_name}.json"
      convert_deck(input_file_path, output_file_name)
    end
  end

  def convert_deck(input_file_path, output_file_path)
    initialize_json_deck_file(input_file_path, output_file_path)

    existing_deck = json_deck_to_hash(output_file_path)
    new_deck_data = txt_deck_to_hash(input_file_path)
    new_deck_data.each {|k, v| existing_deck[k] = v}

    output_file = File.open(output_file_path, "w")
    output_file.puts  new_deck_data.to_json
  end

  # creates new json deck file if it doesn't already exist
  def initialize_json_deck_file(input_file_path, output_file_path)
    unless File.exist?(output_file_path)
      deck = {
        title:       "",
        series:      "",
        description: "",
        black_cards: [],
        white_cards: []
      }
      json_file = File.open(output_file_path, "w+")

      json_file.puts deck.to_json
    end
  end

  def json_deck_to_hash(json_file_path)
    json_deck = File.read(json_file_path)
    JSON.parse(json_deck)
  end

  def txt_deck_to_hash(txt_file_path)
    input_file = File.open(txt_file_path, "r")

    if black_or_white(txt_file_path) == :black
      deck = {black_cards: []}

      input_file.each.with_index do |text, line_number|
        text = text.chomp

        case line_number
        when 0
          deck[:title] = text
        when 1
          deck[:series] = text
        when 2
          deck[:description] = text
        # beyond line 2 are all card text lines 
        else
          number_of_blanks = text.scan("______").count
          # the else condition is for questions that end in "?" without a blank
          pick = number_of_blanks > 0 ? number_of_blanks : 1
          draw = pick >= 3 ? pick - 1 : 0
          card =  {
            text: text,
            pick: pick,
            draw: draw
          }
          deck[:black_cards] << card
        end
      end
    elsif black_or_white(txt_file_path) == :white
      deck = {white_cards: []}

      input_file.each.with_index do |text, line_number|
        text = text.chomp

        case line_number
        when 0
          deck[:title]       = text
        # beyond line 0 are all card text lines 
        else
          card =  {text: text}
          deck[:white_cards] << card
        end
      end
    end

    deck
  end

  def black_or_white(file_path)
    if file_path.match(/\/black\//)
      :black
    elsif file_path.match(/\/white\//)
      :white
    end
  end
end

TextToJsonDeckConverter.new('../raw_decks')