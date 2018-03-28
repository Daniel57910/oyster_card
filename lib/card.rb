class Card

  MAX = 90
  attr_accessor :balance
  attr_reader :journey, :entry_station, :exit_station, :history

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @history = []
  end

  def top_up(amount)
    raise too_much if @balance + amount > MAX
    @balance += amount
  end

  def touch_in(entry_station, zone)
    @entry_station = Station.new
    raise not_enough if insufficient_funds?
    @entry_station.name = entry_station
    @entry_station.zone = zone
    @journey = true
  end

  def touch_out(exit_station, zone)
    @exit_station = Station.new
    @exit_station.name = exit_station
    @exit_station.zone = zone
    deduct
    @journey = false
    save_history
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
    @balance -= @exit_station.cost
  end

  def insufficient_funds?
    @balance - @entry_station.cost < 0
  end

  def save_history
    #look up difference between store and merge
    @history << ( {@entry_station.name => @exit_station.name} )
  end
  
end