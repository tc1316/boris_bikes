require_relative "./bike.rb"
require_relative "./ds.rb"

class Van
    attr_reader :storage
    
    def initialize
        @storage = []
    end
    
    def take_broken_bikes(station)
        if station.instance_of? DockingStation
            station.bikelist.each do |bike|
                if bike.working? == false
                    @storage << bike
                    station.bikelist.delete(bike)
                end
            end
        else raise "That is not a station!"
        end
    end
    
    def return_working_bikes(station)
        if station.instance_of? DockingStation
            @storage.each do |bike|
                if bike.working?
                    @storage.delete(bike)
                    station.bikelist << bike
                end
            end
        else raise "That is not a station!"
        end
    end
    
    def take_working_bikes(garage)
        if garage.instance_of? Garage
            garage.holding.each do |bike|
                if bike.working?
                    garage.holding.delete(bike)
                    @storage << bike
                end
            end
        else raise "That is not a garage!"
        end
    end
    
    def return_broken_bikes(garage)
        if garage.instance_of? Garage
            @storage.each do |bike|
                if bike.working? == false
                    @storage.delete(bike)
                    garage.holding << bike
                end
            end
        else raise "That is not a garage!"
        end
    end
end