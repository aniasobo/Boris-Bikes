require 'docking_station'
require 'bike'

#describe DockingStation do
#  it 'responds to release bike method' do
#    expect(subject).to respond_to :release_bike
#  end
#end

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'gets a bike' do
    bike = subject.release_bike
    expect(bike.working?).to be true
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it 'docks bikes' do
    bike = Bike.new
    dockingstation = DockingStation.new
    expect(dockingstation.dock(bike)).to eq bike
  end
end
