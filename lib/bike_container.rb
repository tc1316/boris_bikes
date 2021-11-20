module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def remove_bike(bike)
    raise "#{self.class.name} empty" if empty?
    bikes.delete(bike)
    return bike
  end

  def add_bike(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
  
  def view_bikes
    list = []
    @bikes.each {|i| list << "#{i.name}: " + (i.working? ? "Working" : "Broken")} 
    return list.join("|")                 
  end

  private

  attr_reader :bikes
end
