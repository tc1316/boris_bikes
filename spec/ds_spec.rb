require "ds"

describe DockingStation do
    it { is_expected.to respond_to(:release_bike)}
    it "should release a bike that can be checked if working" do
        expect(subject.release_bike).to respond_to(:working?)
    end
end
