class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = false, exit_station = false)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    return 6 if illegal_move?
    return 1
  end
  
  private

  def illegal_move?
    @entry_station == false or @exit_station == false
  end

end