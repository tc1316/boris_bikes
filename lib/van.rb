require_relative "./bike.rb"
require_relative "./ds.rb"
require_relative "./garage.rb"

class Van
    attr_reader :storage, :capacity
    DEFAULT_CAPACITY_VAN = 10
    
    def initialize(capacity = DEFAULT_CAPACITY_VAN)
        @storage = []
        @capacity = capacity
    end
   
    def release_bike_to_station(bike=nil,station)
        if empty?
            fail "There are no bikes in the van"
        elsif bike.working? == false
            fail "Bike selected is not working, do not send back to station!"
        else 
            @storage.delete(bike)
            station.bikes << bike
        end
    end
   
    def dock_bike_from_station(bike,station)
        if full?
            fail "There is no room to dock! The van is full"
        elsif bike.working?
            fail "Bike selected is working, do not take from the station!"
        else
            station.bikes.delete(bike)
            @storage << bike
        end
    end
   
    private
    
    def empty?
        if @storage.length == 0
            return true
        else return false
        end
    end
    
    def full?
        if @storage.length == DEFAULT_CAPACITY_VAN
            return true
        else return false
        end
    end
   
    
end