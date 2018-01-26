require_relative 'route'

class Train
  attr_accessor :speed, :carriages, :current_station, :stations, :index
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

  # Не особо нравится идея с index, т.к. это число,
  # которое будет бесконечно расти либо уменьшаться.
  # Хотя, в методе move_next_station я это поправил,
  # надо подумать над тем как это поправить в move
  # previous station.

  def create_route(route)
    self.stations = route.stations
    self.current_station = route.stations[0]
    self.index = stations.index(current_station)
  end

  def move_next_station
    # Если поезд прибыл на конечную - маршрут
    # меняется в противоположную сторону
    if current_station == stations.last
      self.stations = stations.reverse!
      self.index = 0
    end
    self.current_station = stations[index + 1]
    self.index += 1
  end

  def move_previous_station
    self.current_station = stations[index - 1]
    self.index -= 1
  end

  def next_station
    stations[index + 1]
  end

  def previous_station
    stations[index - 1]
  end
end

# route = Route.new('Ботаническая', 'Проспект Космонавтов')

# route.add_station('Автовокзал')

# train = Train.new('24', 'грузовой', 0)

# train.create_route(route)




