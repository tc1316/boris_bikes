require_relative "./bike.rb"

class DockingStation
    attr_reader :bikelist
    
    def initialize 
        @bikelist = []
    end
    
    def release_bike
        bike = Bike.new
    end
    
    def dock(x)
        bikelist << x 
    end
end