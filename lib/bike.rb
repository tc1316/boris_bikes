class Bike 
  attr_reader :name

  def initialize(name="N/A",working=true)
    @name = name
    @working = working
  end

  def report_broken
    @working = false
  end

  def working?
    @working
  end

end
