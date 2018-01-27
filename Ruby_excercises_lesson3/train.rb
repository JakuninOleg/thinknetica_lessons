require_relative 'route'

class Train
  attr_accessor :speed, :carriages, :current_station, :index, :route, :index_info
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
    self.current_station = route.stations[0]
    self.index = route.stations.index(current_station)
  end

  def move_next_station
    if current_station != route.stations.last
      self.current_station = route.stations[index + 1]
      self.index += 1
    end
  end

  def move_previous_station
    if current_station != route.stations.first
      self.current_station = route.stations[index - 1]
      self.index -= 1
    end
  end

  def next_station
    route.stations[index + 1] if index < route.stations.size
  end

  def previous_station
    route.stations[index - 1] if index != 0
  end
end

# route = Route.new('Ботаническая', 'Проспект Космонавтов')

# route.add_station('Автовокзал')

# train = Train.new('24', 'грузовой', 0)

# train.create_route(route)
