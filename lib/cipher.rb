require 'debug'

class String
  def is_upper?
    self == self.upcase
  end
end

class Cipher
  def caesar_cipher(secret, shift)
    alph_positions = secret.split('').map { |chr| chr.ord }
    shifted_alph_positions =
      alph_positions.map do |n|
        if n.between?(65, 90)
          if n + shift > 90
            relative_shift = ((n - 65 + shift) % 26)
            relative_shift == 0 ? n : 65 + relative_shift
          else
            n + shift
          end
        else
          if n + shift > 122
            relative_shift = ((n - 97 + shift) % 26)
            relative_shift == 0 ? n : 97 + relative_shift
          else
            n + shift
          end
        end
      end
    (shifted_alph_positions.map { |n| n.chr }).join
  end
end

secret = Cipher.new
p secret.caesar_cipher('Bababaq', 169)
