require "ds"
require "bike"
require "van"
require "garage"

describe Van do
    it_behaves_like BikeContainer
    subject(:van) { described_class.new }
    let(:name) { "001" }
    let(:name2) { "002" }
    let(:bike) { double(:bike, name: name, :working? => true) }
    let(:broken_bike) { double(:bike, name: name2, :working? => false) }
    let(:station) { DockingStation.new }

    describe "tests:" do
        it "should release working bikes to a station" do
            van.add_bike(broken_bike)
            van.add_bike(bike)
            van.release_bike_to_station(bike,station)
            expect(station.view_bikes).to eq("001: Working")
            expect(van.view_bikes).to eq("002: Broken")
        end
        it "should not able to release a broken bike to a station" do
            van.add_bike(broken_bike)
            expect{van.release_bike_to_station(broken_bike,station)}.to raise_error("Cannot release broken bikes to docking stations")
        end
        it "should be able to dock broken bikes from a station" do
            station.dock(broken_bike)
            van.dock_bike_from_station(broken_bike,station)
            expect(van.view_bikes).to eq("002: Broken")
            expect(station.empty?).to eq(true)
        end
    end    
end