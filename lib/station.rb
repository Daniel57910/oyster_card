class Station

  COST = 1
  #needs to be changed to whatever maximum cost will be
  attr_accessor :name, :zone
  attr_reader :cost
  
  def cost
    COST 
  end

end