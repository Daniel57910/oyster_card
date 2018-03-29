require 'journey'

describe "Journey" do

  subject(:kings_cross) { 1 } 
  subject(:old_street) { 1 }
  subject(:farringdon) { 1 }
  subject(:watford) { 5 }
  #mocking the zones

  describe "#fare" do
    it "returns the max fare (£6) if only one entry is entered" do
      journey = Journey.new(kings_cross)
      expect(journey.fare).to eq 6
    end

    it "returns fare if a legitimate move has been completed" do
      journey = Journey.new(farringdon, watford)
      expect(journey.fare).to eq 5
    end
  end

end