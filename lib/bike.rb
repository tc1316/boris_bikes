class Bike 
  attr_reader :name, :working

  def initialize(name="N/A",working=true)
    @name = name
    @working = working
  end

  def report_broken
    @working = false
  end

  def report_fixed
    @working = true
  end

  def working?
    @working
  end
  
  
  
end
