require 'json'

class TextToJsonConverter
  def initialize(input_folder_location)
    @txt_files = Dir.glob(input_folder_location + "/**/*.txt")
  end

  def run
    @txt_files.each do |file_name|
      input_file = File.open(input_loc, "r")

      output_loc = 'output.json'
      output_file = File.open(output_loc, "w")

      # if directory == black ...

      # if directory == white ...

    end
  end

  def convert_black
    input_file.each.with_index do |text, line_number|
      text = text.chomp
      case line_number
      # title line
      when 0
        deck[:title]       = text
      # series line
      when 1
        deck[:series]      = text
      # deck description line
      when 2
        deck[:description] = text
      # lines >= 3 are card text lines 
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
        deck[:cards] << card
      end

      deck = {
        title:       "",
        series:      "",
        description: "",
        cards:       []
      }
    end

    output_file.puts deck.to_json
  end

  def convert_white
  end
end

TextToJsonConverter.new("../raw_decks")