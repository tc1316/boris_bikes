require_relative "./bike.rb"

class DockingStation
    attr_reader :bikelist
    
    def initialize 
        @bikelist = []
    end
    
    def release_bike
        bike = Bike.new("Placeholder")
    end
    
    def dock(x)
        @bikelist << x 
    end

    def view_bikes
        list = []
        @bikelist.each {|i| list << "#{i.name}"} 
        return list.join("\n")                 
    end
end