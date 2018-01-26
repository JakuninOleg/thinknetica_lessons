class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = {}
  end

  def arrival(train_number, train_type)
    @trains[train_number] = train_type
    puts "На станцию прибыл #{train_type} поезд №#{train_number}"
  end

  def departure(train_number)
    puts "Со станции отбыл #{@trains[train_number]} поезд №#{train_number}"
    @trains.delete(train_number)
  end

  def trains_quantity
    passenger_trains = @trains.values.count('пассажирский')
    cargo_trains = @trains.values.count('грузовой')
    puts "На станции #{passenger_trains} пассажирских и #{cargo_trains} грузовых поездов"
  end
end

station = Station.new('Ботаническая')

p station.name

station.arrival('24', 'грузовой')
station.arrival('44', 'пассажирский')

p station.trains

station.departure('24')

p station.trains

station.trains_quantity
