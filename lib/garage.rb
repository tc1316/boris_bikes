require_relative "./bike.rb"
require_relative "./ds.rb"
require_relative "./van.rb"
require_relative "./bike_container.rb"
require_relative "./bike.rb"

class Garage
    include BikeContainer
    
    def release_bike_to_van(bike=nil,van)
        if bike.working? && van.is_a?(Van)
            remove_bike(bike)
            van.add_bike(bike)
        else raise "Cannot release broken bikes to vans"
        end
    end
    
    def accept_bike_from_van(bike,van)
        if bike.working? == false && van.is_a?(Van)
            van.remove_bike(bike)
            add_bike(bike)
            fix_bike(bike)         
        else raise "Cannot dock working bikes from a van"
        end
    end
    
    def fix_bike(bike)
        bike.report_fixed
    end
    
end