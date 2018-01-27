require_relative 'train'

class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def trains_list(train_type)
    trains.count { |train| train.type.include? train_type }
  end
end

# station = Station.new('Ботаническая')

# train = Train.new('24', 'грузовой', 25)
# train_new = Train.new('24', 'пассажирский', 25)
# train_x = Train.new('24', 'грузовой', 25)

# p station.name

# station.arrival(train)

# station.arrival(train_x)

# p station.trains_list('грузовой')
# p station.trains_list('пассажирский')
