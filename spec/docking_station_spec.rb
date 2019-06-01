require 'docking_station'
require 'bike'
require 'spec_helper'

describe DockingStation do
  describe '#initialize' do
 #   it 'has a default capacity of 20' do
 #   end
    it 'changes capacity with an argument' do
      station = DockingStation.new(21)
      another_station = DockingStation.new
      station_array = []
      another_station_array = []
      21.times { station.dock(Bike.new) }
      21.times { another_station.dock(Bike.new) }
      expect(station_array.count).to be > another_station_array.count
    end
  end
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
      station = DockingStation.new(2)
      2.times { subject.dock Bike.new }
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
