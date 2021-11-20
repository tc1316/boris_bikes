require_relative "./bike.rb"
require_relative "./bike_container.rb"

class DockingStation
    include BikeContainer
    
    def release_bike(bike) 
        working_bikes.delete(bike) #Delete from working_bikes list when removing a bike
        remove_bike(bike)
    end

    def dock(bike)
        add_bike(bike)
    end

    private
    
    def working_bikes
        bikes.each {|bike| bike.working?}
    end

end