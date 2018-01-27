class Route
  attr_accessor :stations
  attr_reader :route_name

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
    @route_name = starting_station + ' - ' + end_station
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  # Список станций в виде массива можно вызвать с помощью команды
  # route.stations, дополнительно создал данный метод

  def show_stations
    stations.each { |station_name| p station_name }
  end
end

# route = Route.new('Ботаническая', 'Проспект Космонавтов')

# p route.route_name

# route.add_station('Геологическая')

# route.show_stations

# route.delete_station('Геологическая')

# route.add_station('Автовокзал')

# p route.stations

# p route.route_name
