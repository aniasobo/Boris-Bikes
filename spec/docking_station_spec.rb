require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
#  it 'gets a bike' do
 #   bike = subject.release_bike
 #   expect(bike.working?).to be true
 # end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it 'docks bikes' do
    bike = Bike.new
    dockingstation = DockingStation.new
    expect(dockingstation.dock(bike)).to eq bike
  end

  it "tells us if the station is full" do
    bike = Bike.new
    expect(subject.dock(bike)).to raise_error "Station is full"
  end
  describe "#release_bike" do
    it 'releases bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
   end

    it 'throws an error when there is no bikes avaliable' do
      expect { subject.release_bike }.to raise_error 'No bikes available atm'
    end
  end
end
