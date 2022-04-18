require 'cipher'

describe Cipher do
  let(:secret) { Cipher.new }
  describe '#caesar_cipher()' do
    context 'when given valid input' do
      it 'cat, 5 => hfy' do
        expect(secret.caesar_cipher('cat', 5)).to eq 'hfy'
      end
      it 'Apex, 4 => Etib' do
        expect(secret.caesar_cipher('Apex', 4)).to eq 'Etib'
      end
      it 'Ruby, 69 => Ilsp' do
        expect(secret.caesar_cipher('Ruby', 69)).to eq 'Ilsp'
      end
      it 'programming, 7 => wyvnyhttpun' do
        expect(secret.caesar_cipher('programming', 7)).to eq 'wyvnyhttpun'
      end
    end
  end
end
