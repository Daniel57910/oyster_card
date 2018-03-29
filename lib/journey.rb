class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = false, exit_station = false)
    @entry_zone = entry_station
    @exit_zone = exit_station
  end

  def fare
    return 6 if illegal_move?
    return zone_fare
  end
  
  private

  def illegal_move?
    @entry_zone == false or @exit_zone == false
  end

  def zone_fare
    @entry_zone >= @exit_zone? (1 + @entry_zone - @exit_zone) : (1 + @exit_zone - @entry_zone)
  end
    
end