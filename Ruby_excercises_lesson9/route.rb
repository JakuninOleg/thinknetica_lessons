class Route
  attr_reader :name, :stations
  include InstanceCounter
  include Validation

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
    validate!
    @name = starting_station.name + ' - ' + end_station.name
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  private

  def validate!
    raise 'Станции должны быть объектом станции!' unless stations_objects?
    true
  end

  def stations_objects?
    stations.first.is_a?(Station) && stations.last.is_a?(Station)
  end
end
