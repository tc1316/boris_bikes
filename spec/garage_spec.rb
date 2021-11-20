require "ds"
require "bike"
require "van"
require "garage"

describe Garage do
    it_behaves_like BikeContainer
    subject(:garage) { described_class.new }
    let(:bike) { Bike.new("001") }
    let(:broken_bike) { Bike.new("002",false) }
    let(:van) { Van.new }

    describe "tests:" do
        it "should be able to call fix method on broken bikes" do
            garage.add_bike(broken_bike)
            expect(broken_bike).to receive :report_fixed
            garage.fix_bike(broken_bike)
        end    
        it "should fix bikes upon receiving them" do
            van.add_bike(broken_bike)
            garage.accept_bike_from_van(broken_bike,van)
            expect(broken_bike.working).to eq(true)
        end
        it "should dock broken bikes from a van and fix them once docked" do
            van.add_bike(broken_bike)
            garage.accept_bike_from_van(broken_bike,van)
            expect(garage.view_bikes).to eq("002: Working")
            expect(van.view_bikes).to be_empty
        end
        it "should be able to release working bikes to a van" do
            garage.add_bike(bike)
            garage.release_bike_to_van(bike,van)
            expect(van.view_bikes).to eq("001: Working")
            expect(garage.view_bikes).to be_empty
        end
        it "should raise error when trying to release broken bike to van" do
            garage.add_bike(broken_bike)
            expect{garage.release_bike_to_van(broken_bike,van)}.to raise_error("Cannot release broken bikes to vans")
        end
    end    
end