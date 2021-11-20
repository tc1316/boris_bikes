require "bike"
require "garage"

describe Bike do
    subject(:bike) { described_class.new("001") }
    subject(:broken_bike) { described_class.new("002",false) }
    let(:garage) { Garage.new }
    let(:van) { Van.new }
    
    describe "tests:" do
        it { is_expected.to respond_to(:working?)}
        it "bikes fixed in the garage are indeed fixed" do
            van.add_bike(broken_bike)
            garage.accept_bike_from_van(broken_bike,van)
            expect(broken_bike.working).to eq(true)
        end    
    end
end

