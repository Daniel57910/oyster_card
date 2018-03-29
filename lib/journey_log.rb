class Journey_Log

  attr_reader :journeys, :entry, :exit
  
  def initialize
    @journeys = []
    @entry = 1
    @exit = 1
  end

  def start(entry = false)
    @entry = entry
    return @entry if illegal_move?
    @entry = entry
  end

  def finish(exits = false)
    @exit = exits
    return @exit if illegal_move?
    add_journey
  end

  private

  def add_journey
    @journeys << {@entry => @exit}
  end

  def illegal_move?
    @entry == false or @exit == false
  end


end