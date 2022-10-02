class InputValidator

  ALPHABET = "ЙЦУКЕНГШЩЗХЇЄЖДЛОРПАВІФЯЧСМИТЬБЮ".split("")

  def check_word?(word)
    return false if word == ''
    letters = word.split("")
    ALPHABET.sort & letters.uniq.sort == letters.uniq.sort
  end

  def check_letter?(letter)
    ALPHABET.include?(letter)
  end

end

