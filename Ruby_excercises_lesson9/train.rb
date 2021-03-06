class Train
  include Company
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :number, :station_index, :route, :carriages, :speed, :type

  attr_accessor_with_history :train_class
  strong_attr_accessor :train_color, String

  VALID_NUMBER = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, VALID_NUMBER

  @@trains = {}

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

  # def validate!
  #   message_format = 'Неверный формат номера поезда(XXX-XX или XXXXX)'
  #   raise message_format unless number =~ VALID_NUMBER
  #   message_existence = 'Поезд с таким номером уже существует!'
  #   raise message_existence unless self.class.find(number).nil?
  #   true
  # end

  def last_station?
    current_station == @route.stations.last
  end

  def first_station?
    current_station == @route.stations.first
  end
end
