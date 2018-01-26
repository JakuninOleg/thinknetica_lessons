require_relative 'route'

class Train
  attr_accessor :speed, :carriages, :route, :current_station

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
  end

  def break
    self.speed = 0
  end

  def carriage_operation(action)
    raise if speed > 0
    if action == 'прицепить'
      self.carriages += 1
      puts "Добавлен вагон. Кол-во вагонов #{self.carriages}"
    elsif action ==  'отцепить'
      self.carriages -= 1
      puts "Отцеплен вагон. Кол-во вагонов #{self.carriages}"
    else
      puts 'Неверное действие'
    end
  end

  def create_route
    @route = Route.new('Ботаническая', 'Проспект Космонавтов')
    self.current_station = @route.stations[0]
    self.route = route
  end

  # Я создал монстра, но работающего, а когда он заработал, я нервно
  # смеялся как доктор Франкенштейн и кричал it's alive :D
  # Скорее всего, всё это можно зарефакторить или вообще переделать
  # фундаментально, да и создавать переменную два раза тоже некрасиво.
  # Ночью уже плохо соображаю, хочу услышать критику и замечания и
  # устранить всё.

  # Возможно, создать переменную в инициализации класса и
  # через неё обращаться. Попробую уже завтра.

  def move(destination)
    find_station_index = @route.stations.index(current_station)
    if destination == 'вперед'
      self.current_station = @route.stations[find_station_index + 1]
    elsif destination == 'назад'
      self.current_station = @route.stations[find_station_index - 1]
    end
  end

  def report_nearby_stations
    find_station_index = @route.stations.index(current_station)
    puts "Текущая станция #{current_station}"
    puts "Следующая станция #{@route.stations[find_station_index + 1]}"
    puts "Предыдущая станция #{@route.stations[find_station_index - 1]}"
  end
end

train = Train.new('24', 'kek', 25)
train.break
p train.speed

train.carriage_operation('прицепить')

train.carriage_operation('отцепить')

train.create_route

train.route.add_station('Автовокзал')

p train.route.stations

p train.current_station

train.move('вперед')

p train.current_station

train.report_nearby_stations

train.move('назад')

p train.current_station

train.report_nearby_stations

train.speed = 25

train.carriage_operation('отцепить')
