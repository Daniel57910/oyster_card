require 'app'

describe "Journey" do

  subject(:kings_cross) {double(:station, :name => "Kings Cross")}
  subject(:old_street) {double(:station, :name => "Old Street")}

  describe "#fare" do
    it "returns the max fare (£6) if only one entry is entered" do
      journey = Journey.new(kings_cross)
      expect(journey.fare).to eq 6
    end

    it "returns 1 if a legitimate move has been completed" do
      journey = Journey.new(kings_cross, old_street)
      expect(journey.fare).to eq 1
    end
  end

end