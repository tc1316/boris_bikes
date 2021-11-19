require_relative "./bike.rb"
require_relative "./van2.rb"

class DockingStation
    attr_reader :bikelist, :capacity
    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @bikelist = []
        @capacity = capacity
    end
    
    def release_bike(bike=nil)
        if empty?
            fail "There are no bikes left"
        elsif bike.working? == false
            fail "Bike selected is not working!"
        else 
            @bikelist.delete(bike)
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
        @bikelist.each {|i| list << "#{i.name}: Working? #{i.working?}"} 
        return list.join("|")                 
    end

    private
    def empty?
        if @bikelist.length == 0
            return true
        else return false
        end
    end

    def full?
        if @bikelist.length == DEFAULT_CAPACITY
            return true
        else return false
        end
    end
end