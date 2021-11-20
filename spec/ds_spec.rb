require "ds"
require "bike"
require "support/shared_examples_for_bike_container"


describe DockingStation do
    it_behaves_like BikeContainer
    subject(:station) { described_class.new }
    let(:name) { "001" }
    let(:name2) { "002" }
    let(:bike) { double(:bike, name: name, :working? => true) }
    let(:broken_bike) { double(:bike, name: name2, :working? => false) }

    describe "tests:" do
        it "should be able to show us docked bikes" do
            station.dock(bike)
            expect(station.view_bikes).to eq("001: Working")
        end
        it "shouldn't release a bike when the dock is empty" do 
            expect{station.release_bike}.to raise_error("DockingStation empty")
        end
        it "shouldn't dock a bike if docking station is full" do
            expect{(DockingStation::DEFAULT_CAPACITY+1).times{station.dock(bike)}}.to raise_error("DockingStation full")
        end
        it "it should let you assign a custom capacity" do
            expect(DockingStation.new(5).capacity).to eq(5)
        end
        it "it should have a default capacity of 20" do
            expect(station.capacity).to eq(20)
        end
        it "should know if bikes are broken" do
            station.dock(broken_bike)
            expect(station.view_bikes).to eq("002: Broken")
        end
        it "should accept returning bikes whether broken or not" do
            station.dock(bike)
            station.dock(broken_bike)
            expect(station.view_bikes).to eq("001: Working|002: Broken")
        end
        it "should only release working bikes" do
            station.dock(bike)
            station.dock(broken_bike)
            station.release_bike(bike)
            expect(station.view_bikes).to eq("002: Broken")
        end
        
    end
end