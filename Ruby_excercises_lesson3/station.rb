require_relative 'train'

class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = {}
  end

  def arrival(train)
    trains[train.number] = train.type
  end

  def departure(train)
    trains.delete(train.number)
  end

  def trains_list(train_type)
    trains.values.count(train_type)
  end
end

# station = Station.new('Ботаническая')

# train = Train.new('24', 'грузовой', 25)

# p station.name

# station.arrival(train)

# p station.trains

# p station.trains_list('грузовой')

# p station.trains_list('пассажирский')
