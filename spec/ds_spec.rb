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
        bike = Bike.new("1")
        station.dock(bike)
        bike2 = Bike.new("2")
        expect{station.dock(bike2)}.to raise_error("There is no room to dock!")
    end
end
