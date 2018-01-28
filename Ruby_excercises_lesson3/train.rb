class Train
  attr_reader :number, :type, :station_index, :route, :carriages, :speed

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def accelerate
    while @speed < 60
      @speed += 10
      sleep 0.5
      p @speed
    end
  end

  def decelerate
    while @speed > 0
      @speed -= 10
      sleep 0.5
      p @speed
    end
  end

  def carriage_add
    @carriages += 1 if speed.zero?
  end

  def carriage_remove
    @carriages -= 1 if speed.zero? && carriages > 0
  end

  def create_route(route)
    @route = route
    @station_index = 0
    current_station.arrival(self)
  end

  def current_station
    @route.stations[station_index]
  end

  def move_next_station
    if @current_station != @route.stations.last
      current_station.departure(self)
      accelerate
      decelerate
      next_station.arrival(self)
      @station_index += 1
    end
  end

  def move_previous_station
    if current_station != @route.stations.first
      current_station.departure(self)
      accelerate
      decelerate
      previous_station.arrival(self)
      @station_index -= 1
    end
  end

  def next_station
    @route.stations[@station_index + 1] if @station_index < @route.stations.size
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index != 0
  end
end
