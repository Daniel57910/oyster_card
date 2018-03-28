require 'app'

describe Card do

  subject(:card) { described_class.new } 
  subject(:card_money) { described_class.new(5) }

  it "should automatically set the balance to 0" do
    expect(card.balance).to eq 0
  end

  it "the hash table should be empty on initialization" do
    expect(card.history.length).to eq 0
  end

  describe "#top_up" do
    it "allows the user to add a given amount to the card" do
      expect(card.top_up(10)).to eq card.balance
    end
    it "raises an error if balance > max (90)" do
      expect { card.top_up(100) }.to raise_error "The maximum you can hold on your card is 90"
    end
  end

  describe "#touch_in" do
    it "accepts the station and the zone as arguments" do
      expect(subject).to respond_to(:touch_in).with(2).arguments
    end
    it "raises an error if there are insufficient funds on card" do 
      expect {card.touch_in("Old_St", 1)}.to raise_error "Insufficient funds on card"
    end
    it "changes the status of the journey to be true" do
      card_money.touch_in("Old_St", 1)
      expect(card_money.journey).to eq true
    end
  end

  describe "#touch_out" do
    before(:each) do
      card_money.touch_in("Old_St", 1)
      card_money.touch_out("Kings Cross", 1)
    end
    #implicit testing of the private methods
    it "calls the private methods for deducting money and returns the balance" do
      expect(card_money.send(:deduct)).to eq card_money.balance
    end
    it "saves the previous journey into the history array" do
      expect(card_money.send(:save_history)).to eq card_money.history
    end
    it "changes the status of the journey to be false" do
      expect(card_money.journey).to eq false
    end
  end

end

  