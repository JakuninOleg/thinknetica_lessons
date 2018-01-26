class Route
  attr_accessor :stations

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @stations = [starting_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end

route = Route.new('Ботаническая', 'Проспект Космонавтов')

route.add_station('Геологическая')

route.delete_station('Геологическая')

route.add_station('Автовокзал')
