require "ds"
require "bike"
require "van2"
require "garage"

describe Van do
    subject(:van) { described_class.new }
    let(:name) { "001" }
    let(:name2) { "002" }
    let(:bike) { bike = double(:bike, name: name, :working? => true) }
    let(:broken_bike) { bike = double(:bike, name: name2, :working? => false) }
    
    describe "Van" do
        it "should release working bikes to a station" do
            van.storage.push(broken_bike, bike)
            station = DockingStation.new
            van.release_bike_to_station(bike,station)
            expect(van.storage).to match_array([broken_bike])
            expect(station.bikelist).to match_array([bike])
        end
        it "should be able to dock broken bikes from a station" do
            station = DockingStation.new
            station.dock(broken_bike)
            van.dock_bike_from_station(broken_bike,station)
            expect(van.storage).to match_array([broken_bike])
            expect(station.bikelist).to be_empty
        end
    end    
end