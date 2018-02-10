class Station
  attr_reader :name, :trains
  include InstanceCounter
  include Validation

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def trains_list(train_type)
    @trains.count { |train| train.type == train_type }
  end

  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def block_station_trains(block)
    @trains.each { |train| block.call(train) }
  end

  def validate!
    message_name = 'У станции должно быть название'
    message_length = 'Слишком длинное название станции(30 символов)'
    message_existence = 'Такая станция уже существует'
    raise message_name if name.strip.empty?
    raise message_length if name.length > 30
    raise message_existence if @@stations.map(&:name).include?(name)
  end
end
