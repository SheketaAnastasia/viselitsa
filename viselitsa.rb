require 'unicode'
require_relative 'lib/game.rb'
require_relative 'lib/result_printer.rb'
require_relative 'lib/input_validator.rb'
require_relative 'lib/word_reader.rb'


validator = InputValidator.new
result_printer = ResultPrinter.new
word_reader = WordReader.new
current_path = File.dirname(__FILE__)
words_file = current_path + "/data/wordlist.txt"

puts "Гра Шибениця"
puts "Правила:"
puts "Вам необхідно відгадати загадане слово, вводячи по одній літері за раз"
puts "Якщо введена вами буква є у слові, вона відкриється"
puts "Якщо введеної літери в слові немає, то вам зарахується помилка"
puts "Для того, щоб виграти, необхідно відгадати всі літери в слові допустивши не більше 7 помилок"
puts "Натисніть ENTER, якщо ви готові розпочати"
gets

word = word_reader.read_from_file(words_file)
word = Unicode::upcase(word)

abort "Слово містить неприпустимі символи! Допустимі лише літери російського алфавіту" unless validator.check_word?(word)

game = Game.new(word)

while game.status == 0 do

  result_printer.print_status(game)

  puts
  puts "Введіть наступну літеру"

  letter = ''

  until validator.check_letter?(letter) do
    letter = STDIN.gets.chomp.encode('UTF-8')
    letter = Unicode::upcase(letter)

  end

  game.evaluate(letter)

end

result_printer.print_status(game)