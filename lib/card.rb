class Card

  MAX = 90
  MAX_CHARGE = 6
  attr_accessor :balance
  attr_reader :journey, :entry_station, :exit_station, :journey_log

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @journey_log = Journey_Log.new
  end

  def top_up(amount)
    @amount = amount
    raise too_much_message if too_much?
    @balance += @amount
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    raise not_enough if insufficient_funds?
    raise already_in if touched_in?
    @journey_log.start(@entry_station.name)
    @journey = true
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    @journey_log.finish(@exit_station.name)
    @journey = false
    deduct
  end

  private

  def too_much_message
   "The maximum you can hold on your card is 90"
  end

  def already_in
    "Please touch out before beginning a new journey"
  end

  def not_enough
    "Insufficient funds on card"
  end

  def too_much?
    @balance + @amount > MAX
  end

  def insufficient_funds?
    @balance - MAX_CHARGE < 0
  end

  def touched_in?
    @journey
  end

  def insufficient_funds?
    @balance - MAX_CHARGE < 0
  end

  def journey_balance
    @current_journey = Journey.new(@entry_station.zone, @exit_station.zone)
    @current_journey.fare
  end

  def deduct
    @balance -= journey_balance
  end

end