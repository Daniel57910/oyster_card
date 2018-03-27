class Card

  MAX = 90
  attr_accessor :balance
  attr_reader :journey, :entry_station, :history

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @station = Station.new
    @history = []
  end

  def top_up(amount)
    raise too_much if @balance + amount > MAX
    @balance += amount
  end

  def touch_in(entry_station = nil)
    raise not_enough if @balance - @station.cost < 0
    @journey = true
    @entry_station = entry_station
    save_history
  end

  def touch_out
     deduct
    @journey = false
  end

  def journey?
    @journey
  end


  private

  def too_much
   "The maximum you can hold on your card is 90"
  end

  def not_enough
    "Insufficient funds on card"
  end

  def deduct
    @balance -= @station.cost
  end

  def save_history
    @history << @entry_station
    @history
  end

end