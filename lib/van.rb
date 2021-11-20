require_relative "./bike.rb"
require_relative "./ds.rb"
require_relative "./bike_container.rb"

class Van
    include BikeContainer

    def release_bike_to_station(bike,station)
        if bike.working? && station.is_a?(DockingStation)
            station.add_bike(bike)
            remove_bike(bike)
        else raise "Cannot release broken bikes to docking stations"
        end
    end
   
    def dock_bike_from_station(bike,station)
        if bike.working? == false && station.is_a?(DockingStation)
            station.remove_bike(bike)
            add_bike(bike)
        else raise "Cannot dock working bikes onto vans"
        end
    end
   
end