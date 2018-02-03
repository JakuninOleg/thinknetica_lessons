class Station
  attr_reader :name, :trains
  include InstanceCounter

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def trains_list(train_type)
    trains.count { |train| train.type == train_type }
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end
end
