require "ds"

describe DockingStation do
    it { is_expected.to respond_to(:release_bike)}
    it "should release a bike that can be checked if working" do
        expect(subject.release_bike).to respond_to(:working?)
    end
    it { is_expected.to respond_to(:dock)}
    it "should be able to dock a bike" do
        bike = Bike.new
        station = DockingStation.new
        station.dock(bike)   
        expect(station.bikelist).to include(bike)
    end
end
