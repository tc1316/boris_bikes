require "ds"
require "bike"

describe DockingStation do
    it "should be able to dock a bike" do
        bike = Bike.new()
        station = DockingStation.new
        station.dock(bike)   
        expect(station.bikelist).to include(bike)
    end
    it "should be able to show us the docked bikes" do
        bike = Bike.new("001")
        station = DockingStation.new
        station.dock(bike)
        expect(station.view_bikes).to eq("001: Working")
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
    it "should know if bikes are broken" do
        station = DockingStation.new
        bb = Bike.new
        bb.broken
        station.dock(bb)
        expect(station.bikelist[0].working?).to eq(false)
    end
    it "should accept returning bikes whether broken or not" do
        station = DockingStation.new
        wb = Bike.new("001")
        station.dock(wb)
        bb = Bike.new("002","Broken")
        station.dock(bb)
        expect(station.bikelist.length).to eq(2)
    end
    it "should only release working bikes" do
        station = DockingStation.new
        wb = Bike.new("001")
        station.dock(wb)
        bb = Bike.new("002","Broken")
        station.dock(bb)
        station.release_bike(wb)
        expect(station.bikelist).to match_array([bb])
        expect{station.release_bike(bb)}.to raise_error("Bike selected is not working!")
    end
    
end