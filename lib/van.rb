require_relative "./bike.rb"
require_relative "./ds.rb"

class Van
    attr_reader :storage
    
    def initialize
        @storage = []
    end

    def take_bikes(x) #Argument is either DockingStation instance or Garage instance
        if is_station?(x)
            take_broken_bikes(x)
        elsif is_garage?(x)
            take_working_bikes(x)
        else raise "You have not selected a station or garage to take bikes from!"
        end
    end
    
    def take_working_bikes(x)
        get_bikelist_or_holding(x).each do |bike|
            if bike.working?
                @storage << bike
                get_bikelist_or_holding(x).delete(bike)
            end
        end
    end
    
    def take_broken_bikes(x)
        get_bikelist_or_holding(x).each do |bike|
            if bike.working? == false
                @storage << bike
                get_bikelist_or_holding(x).delete(bike)
            end
        end
    end
    
    def return_bikes(x) #Argument is either DockingStation instance or Garage instance
        if is_station?(x)
            return_working_bikes(x)
        elsif is_garage?(x)
            return_broken_bikes(x)
        else raise "You have not selected a station or garage to return bikes to!"
        end
    end
    
    def return_working_bikes(x)
        get_bikelist_or_holding(x).each do |bike|
            if bike.working?
                @storage.delete(bike)
                get_bikelist_or_holding(x) << bike
            end
        end
    end
    
    def return_broken_bikes(x)
        get_bikelist_or_holding(x).each do |bike|
            if bike.working? == false
                @storage.delete(bike) 
                get_bikelist_or_holding(x) << bike
            end
        end
    end
    
    
    private
    
    def is_station?(x)
        return true if x.instance_of? DockingStation
    end
    
    def is_garage?(x)
        return true if x.instance_of? Garage
    end

    def get_bikelist_or_holding(x) #Returns first instance variable of DockingStation or Garage class, which are bikelist and holding respectively
        return x.instance_variable_get(x.instance_variables[0]) 
    end
    
end