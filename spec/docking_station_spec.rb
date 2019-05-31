require 'docking_station'
require 'bike'

describe DockingStation do
 # it { is_expected.to respond_to :release_bike }
  it 'gets a bike' do
    bike = Bike.new
    #subject.dock(bike)
    #subject.release_bike
    expect(bike.working?).to be true
  end
  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks bikes' do
      bike = Bike.new
      dockingstation = DockingStation.new
      expect(dockingstation.dock(bike)).to eq 'Docked!' #output('Docked!').to_stdout
    end
    it 'raises error if the station is full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new}.to raise_error('Station full')
    end
  end
  describe '#release_bike' do
    it 'releases bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
   end

    it 'throws an error when no bikes avaliable' do
  #    20.times { subject.release_bike }
      expect { subject.release_bike }.to raise_error('Station empty')
    end
  end
end
