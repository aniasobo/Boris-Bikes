require_relative 'bike'
class DockingStation

  attr_reader :bikes
  attr_reader :capacity

  def initialize
    @bikes = []
  end

  def release_bike
    if empty?
      fail 'Station empty'
    end
    p @bikes.pop
    p "Bike!"
  end

  def dock(bike)
    if full? 
      fail 'Station full'
    end
      @bikes << bike
      p "Docked!"
  end

  private

  def full?
    return true if @bikes.length >= 20
  end

  def empty?
    return true if @bikes.length < 20
  end
end
