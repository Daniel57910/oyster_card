require 'journey_log'

describe "Journey_Log" do

  subject(:kings_cross) { double(:journey, :name => "Kings Cross") }
  subject(:paddington) { double(:journey, :name => "Paddington") }

  describe "#start" do
    it "returns false if no start station entered" do
      history = Journey_Log.new
      expect(history.start).to eq false
    end

    it "saves the start station to the start method" do
      history = Journey_Log.new
      expect(history.start(kings_cross)).to eq history.entry
    end
  end

  describe "#finish" do

    it "returns false if no end station entered" do
      history = Journey_Log.new
      expect(history.finish).to eq false
    end

    it "saves the end station to the finish method" do
      history = Journey_Log.new
      history.start(kings_cross)
      expect(history.finish(paddington)).to eq history.journeys
    end

  end

end