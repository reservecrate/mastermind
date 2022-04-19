require 'substrings.rb'

describe Substrings do
  let(:dict) do
    %w[below down go going horn how howdy it i low own part partner sit]
  end
  describe '#find_substrings()' do
    it "'below', dict => { 'below' => 1, 'low' => 1 }" do
      expect(subject.find_substrings('below', dict)).to eq(
        { 'below' => 1, 'low' => 1 }
      )
    end
    it "'Howdy partner, sit down! How's it going?', dict => { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 }" do
      expect(
        subject.find_substrings(
          "Howdy partner, sit down! How's it going?",
          dict
        )
      ).to eq(
        {
          'down' => 1,
          'go' => 1,
          'going' => 1,
          'how' => 2,
          'howdy' => 1,
          'it' => 2,
          'i' => 3,
          'own' => 1,
          'part' => 1,
          'partner' => 1,
          'sit' => 1
        }
      )
    end
  end
end
