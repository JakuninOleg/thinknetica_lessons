class Train
  attr_accessor :index, :route, :carriages, :speed
  attr_reader :number, :type

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def break
    self.speed = 0
  end

  def carriage_add
    self.carriages += 1 if speed.zero?
  end

  def carriage_remove
    self.carriages -= 1 if speed.zero? && carriages > 0
  end

  def create_route(route)
    self.route = route
    self.index = 0
    current_station.arrival(self)
  end

  def current_station
    route.stations[index]
  end

  def move_next_station
    current_station.departure(self)
    next_station.arrival(self)
    self.index += 1
  end

  def move_previous_station
    current_station.departure(self)
    previous_station.arrival(self)
    self.index -= 1
  end

  def next_station
    route.stations[index + 1] if index < route.stations.size
  end

  def previous_station
    route.stations[index - 1] if index != 0
  end
end
