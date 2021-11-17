require "ds"

describe DockingStation do
    it "should release a bike that can be checked if working" do
        expect(subject.release_bike).to respond_to(:working?)
    end
    it "should be able to dock a bike" do
        bike = Bike.new("Titus")
        station = DockingStation.new
        station.dock(bike)   
        expect(station.bikelist).to include(bike)
    end
    it "should be able to show us the docked bikes" do
        bike = Bike.new("Titus")
        bike2 = Bike.new("Waqas")
        station = DockingStation.new
        station.dock(bike)
        station.dock(bike2)
        expect(station.view_bikes).to eq("Titus\nWaqas")
    
    end
end
