require 'debug'

class Substrings
  def find_substrings(str, dict)
    x =
      dict.reduce(Hash.new) do |acc, word|
        acc[word] = str.scan(Regexp.new(word, 'i')).length if str.scan(
          Regexp.new(word, 'i')
        ).length > 0
        acc
      end
    # debugger
  end
end

dict = %w[below down go going horn how howdy it i low own part partner sit]
s = Substrings.new
s.find_substrings('below', dict)
