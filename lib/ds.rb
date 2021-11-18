require_relative "./bike.rb"

class DockingStation
    attr_reader :bikelist
    
    def initialize 
        @bikelist = []
    end
    
    def release_bike
        if empty?
            fail "There are no bikes left"
        else 
            Bike.new
        end
    end

    def dock(bike)
        if full?
            fail "There is no room to dock!"
        else
            @bikelist << bike
        end
    end

    def view_bikes
        list = []
        @bikelist.each {|i| list << "#{i.name}"} 
        return list.join("\n")                 
    end

    private
    def empty?
        if @bikelist.length == 0
            return true
        else return false
        end
    end

    def full?
        if @bikelist.length == 20
            return true
        else return false
        end
    end
end