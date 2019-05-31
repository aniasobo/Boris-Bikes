require 'docking_station'
require 'bike'
require 'spec_helper'

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
      bikes_docked = dockingstation.dock(bike)
      expect(bikes_docked.size).to be >= 1
    end
    it 'raises error if the station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new}.to raise_error('Station full')
    end
  end
  describe '#release_bike' do
    before(:each) do
      @bike = Bike.new
      @station = DockingStation.new
      @station.dock(@bike)
    end
    it 'releases bike' do
      expect(@station.release_bike).to eq(@bike)
   end

    it 'throws an error when no bikes avaliable' do
      @station.release_bike
      expect { @station.release_bike }.to raise_error('Station empty')
    end
  end
end
