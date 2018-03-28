class Card

  MAX = 90
  MAX_CHARGE = 6
  attr_accessor :balance
  attr_reader :journey, :entry_station, :exit_station, :history

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @history = []
  end

  def top_up(amount)
    @amount = amount
    raise too_much_message if too_much?
    @balance += @amount
  end

  def touch_in(entry_station)
    raise not_enough if insufficient_funds?
    #raise error if try to touch in twice in a row
    @entry_station = entry_station
    @journey = true
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    @journey = false
    deduct
    save_history
  end

  def in_station?
    @journey
  end

  private

  def too_much_message
   "The maximum you can hold on your card is 90"
  end

  def too_much?
    @balance + @amount > MAX
  end

  def not_enough
    "Insufficient funds on card"
  end

  def deduct
    @balance -= @exit_station.cost
  end

  def insufficient_funds?
    @balance - MAX_CHARGE < 0
  end

  def save_history
    @history << ( {@entry_station.name => @exit_station.name} )
  end
  
end