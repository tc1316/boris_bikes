require "ds"

describe DockingStation do
    it "should be able to dock a bike" do
        bike = Bike.new()
        station = DockingStation.new
        station.dock(bike)   
        expect(station.bikelist).to include(bike)
    end
    it "should be able to show us the docked bikes" do
        bike = Bike.new("Titus")
        station = DockingStation.new
        station.dock(bike)
        expect(station.view_bikes).to eq("Titus")
    end
    it "Shouldn't release a bike when the dock is empty" do 
        station = DockingStation.new
        expect{station.release_bike}.to raise_error("There are no bikes left")
    end
    it "shouldn't dock a bike if docking station is full" do
        station = DockingStation.new
        expect{(DockingStation::DEFAULT_CAPACITY+1).times{station.dock(Bike.new)}}.to raise_error("There is no room to dock!")
    end
    it "it should let you assign a custom capacity" do
        station = DockingStation.new(5)
        expect(station.capacity).to eq(5)
    end
    it "it should have a default capacity of 20" do
        station = DockingStation.new
        expect(station.capacity).to eq(20)
    end
end
