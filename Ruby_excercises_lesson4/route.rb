class Route
  attr_reader :name, :stations

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
    @name = starting_station.name + ' - ' + end_station.name
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end


