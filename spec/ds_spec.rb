require "ds"
require "bike"

describe DockingStation do
    subject(:station) { described_class.new}
    let(:name) { "001" }
    let(:name2) { "002" }
    let(:bike) { bike = double(:bike, name: name, :working? => true) }
    let(:broken_bike) { bike = double(:bike, name: name2, :working? => false) }

    describe "DockingStation tests" do
        it "should be able to dock a bike" do
            station.dock(bike)
            expect(station.bikelist).to include(bike)
        end
        it "should be able to show us the docked bikes" do
            station.dock(bike)
            expect(station.view_bikes).to eq("001: Working? true")
        end
        it "Shouldn't release a bike when the dock is empty" do 
            expect{station.release_bike}.to raise_error("There are no bikes left")
        end
        it "shouldn't dock a bike if docking station is full" do
            expect{(DockingStation::DEFAULT_CAPACITY+1).times{station.dock(bike)}}.to raise_error("There is no room to dock!")
        end
        it "it should let you assign a custom capacity" do
            expect(DockingStation.new(5).capacity).to eq(5)
        end
        it "it should have a default capacity of 20" do
            expect(station.capacity).to eq(20)
        end
        it "should know if bikes are broken" do
            station.dock(broken_bike)
            expect(station.bikelist[0]).not_to be_working
        end
        it "should accept returning bikes whether broken or not" do
            station.dock(bike)
            station.dock(broken_bike)
            expect(station.bikelist).to match_array([bike,broken_bike])
        end
        it "should only release working bikes" do
            station.dock(bike)
            station.dock(broken_bike)
            station.release_bike(bike)
            expect(station.bikelist).to match_array([broken_bike])
            expect{station.release_bike(broken_bike)}.to raise_error("Bike selected is not working!")
        end
    end
end