require_relative "./bike.rb"
require_relative "./ds.rb"
require_relative "./van.rb"

class Garage
    attr_reader :holding, :capacity
    DEFAULT_CAPACITY_GARAGE = 30
    
    def initialize
        @holding = []
        @capacity = capacity
    end
    
    def dock_bike_from_van(bike,van)
        if full?
            fail "There is no room to dock! The garage is full"
        elsif bike.working? 
            fail "Bike selected is working, do not take from the van!"
        else
            van.storage.delete(bike)
            @holding << bike
            @holding.each {|bike| bike.report_fixed}
        end
    end
    
    def release_bike_to_van(bike=nil,van)
        if empty?
            fail "There are no bikes in the garage"
        elsif bike.working? == false
            fail "Bike selected is not working, do not send back to van until fixed!"
        else 
            @holding.delete(bike)
            van.storage << bike
        end
    end   
    
    private
    def empty?
        if @holding.length == 0
            return true
        else return false
        end
    end

    def full?
        if @holding.length == DEFAULT_CAPACITY_GARAGE
            return true
        else return false
        end
    end
   
    
end