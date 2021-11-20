require "ds"
require "bike"
require "van"
require "garage"

describe Garage do
    subject(:garage) { described_class.new }
 
    describe "Garage" do
        it "should fix bikes upon receiving them" do
            van = Van.new
            broken_bike = Bike.new("001",false)
            van.storage.push(broken_bike)
            garage.dock_bike_from_van(broken_bike,van)
            expect(broken_bike.working).to eq(true)
        end    
        it "should dock broken bikes from a van" do
            van = Van.new
            broken_bike = Bike.new("001",false)
            bike = Bike.new
            van.storage.push(broken_bike, bike)
            garage.dock_bike_from_van(broken_bike,van)
            expect(van.storage).to match_array([bike])
            expect(garage.holding).to match_array([broken_bike])
        end
        it "should be able to release working bikes to a van" do
            van = Van.new
            bike = Bike.new
            garage.holding.push(bike)
            garage.release_bike_to_van(bike,van)
            expect(van.storage).to match_array([bike])
            expect(garage.holding).to be_empty
        end
    end    
end