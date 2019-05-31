require_relative 'bike'
class DockingStation

  attr_reader :bikes
  attr_reader :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    if @bikes.length == 0
      fail 'Station empty'
    end
    @bikes.pop
  end

  def dock(bike)
    if @bikes.length == capacity
      fail 'Station full'
    else
      @bikes << bike
      p "Docked!"
    end
  end

end
