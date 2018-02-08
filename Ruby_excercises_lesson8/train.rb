class Train
  attr_reader :number, :station_index, :route, :carriages, :speed, :type
  include Company
  include InstanceCounter
  include Validation

  @@trains = {}

  VALID_NUMBER = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    validate!
    @carriages = []
    @speed = 0
    @@trains[number] = self
    register_instance
  end

  def accelerate
    @speed += 10 while @speed < 60
  end

  def decelerate
    @speed -= 10 while @speed > 0
  end

  def carriage_add(carriage_type)
    @carriages << carriage_type if speed.zero?
  end

  def carriage_remove(carriage)
    @carriages.delete(carriage) if speed.zero?
  end

  def create_route(route)
    @route = route
    @station_index = 0
    current_station.arrival(self)
  end

  def current_station
    @route.stations[station_index]
  end

  def move_next_station
    return if last_station?

    current_station.departure(self)
    accelerate
    decelerate
    next_station.arrival(self)
    @station_index += 1
  end

  def move_previous_station
    return if first_station?

    current_station.departure(self)
    accelerate
    decelerate
    previous_station.arrival(self)
    @station_index -= 1
  end

  def next_station
    @route.stations[@station_index + 1] if @station_index < @route.stations.size
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index != 0
  end

  def block_train_carriages(block)
    @carriages.each { |carriage| block.call(carriage) }
  end

  protected

  # Методы, используемые внутри класса, доступны в подклассах

  def validate!
    raise 'Неверный формат номера позда. Введите данные в формате XXX-XX или XXXXX. Допускается использование только цифр и букв.' unless number =~ VALID_NUMBER
    raise 'Поезд с таким номером уже существует!' unless self.class.find(number).nil?
    true
  end

  def last_station?
    current_station == @route.stations.last
  end

  def first_station?
    current_station == @route.stations.first
  end
end
