require_relative "./bike.rb"
require_relative "./van.rb"
require_relative "./bike_container.rb"

class DockingStation
    include BikeContainer
    
    def release_bike(bike=nil)
        fail "DockingStation empty" if working_bikes.empty?
        #else
        working_bikes.delete(bike)
        remove_bike(bike)
    end

    def dock(bike)
        add_bike(bike)
    end

    def view_bikes
        list = []
        @bikes.each {|i| list << "#{i.name}: " + (i.working? ? "Working" : "Broken")} 
        return list.join("|")                 
    end

    private
    
    def working_bikes
        bikes.each {|bike| bike.working?}
    end

end