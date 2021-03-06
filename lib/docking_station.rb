require_relative 'bike'
class DockingStation

  attr_reader :bikes
 # DEFAULT_CAPACITY = 20

  def initialize(capacity=20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if bikes?
      @bikes.pop
    elsif empty?
      fail 'Station empty'
    end
  end

  def dock(bike)
    if full? 
      fail 'Station full'
    end
      @bikes << bike
  end

  private

  def full?
    return true if @bikes.size >= @capacity
  end

  def empty?
    return true if @bikes.size == 0
  end

  def bikes?
    return true if @bikes.size > 0 && @bikes.size <= @capacity
  end
end
