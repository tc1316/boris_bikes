require "ds"
require "bike"
require "van"
require "garage"

describe Van do
    subject(:van) { described_class.new }
    let(:name) { "001" }
    let(:name2) { "002" }
    let(:bike) { bike = double(:bike, name: name, :working? => true) }
    let(:broken_bike) { bike = double(:bike, name: name2, :working? => false) }
    
    describe "Van tests" do
        it "should only take broken bikes from docking stations" do
            station = DockingStation.new
            station.dock(bike)
            station.dock(broken_bike)
            van.take_broken_bikes(station)
            expect(station.bikelist).to match_array([bike])
            expect(van.storage).to match_array([broken_bike])
        end
        it "should only return working bikes to docking stations" do
            station = DockingStation.new
            van.storage.push(bike, broken_bike)
            van.return_working_bikes(station)
            expect(station.bikelist).to match_array([bike])
            expect(van.storage).to match_array([broken_bike])
        end
        it "should only take working bikes from garages" do
            garage = Garage.new
            garage.holding.push(bike, broken_bike)
            van.take_working_bikes(garage)
            expect(garage.holding).to match_array([broken_bike])
            expect(van.storage).to match_array([bike])
        end
        it "should only return broken bikes to garages" do
            garage = Garage.new
            van.storage.push(bike, broken_bike)
            van.return_broken_bikes(garage)
            expect(garage.holding).to match_array([broken_bike])
            expect(van.storage).to match_array([bike])
        end
    end
    
end