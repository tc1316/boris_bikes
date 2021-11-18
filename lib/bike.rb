class Bike 
  attr_reader :name, :condition

  def initialize(name="N/A",condition="Working")
    @name = name
    @condition = condition
  end

  def working?
    if @condition == "Working"
      return true
    else return false
    end
  end

  def broken
    @condition = "Broken"
  end

end
