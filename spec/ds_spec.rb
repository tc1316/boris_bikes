require "ds"

describe DockingStation do
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
    it "Shouldn't release a bike when the dock is empty" do 
        station = DockingStation.new
        expect{station.release_bike}.to raise_error("There are no bikes left")
    end
end
