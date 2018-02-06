require_relative 'company'
require_relative 'validation'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

class Controller
  def initialize
    @trains = []
    @routes = []
    @stations = []
    @view = View.new
  end

  def create_station
    name = @view.ask_for_station_name
    station = Station.new(name)
    @stations << station
    puts "Станция #{station.name} успешно создана!"
  end

  def create_train
    number = @view.ask_for_train_number
    type = @view.ask_for_train_type
    if type == 1
      train = PassengerTrain.new(number)
    elsif type == 2
      train = CargoTrain.new(number)
    end
    @trains << train
    puts "#{train.class} номер #{train.number} успешно создан!"
  rescue RuntimeError => e
    puts e.message
    puts 'Попробуйте снова:'
  end

  def create_route
    show_stations
    starting_station = @stations[@view.ask_for_starting_station]
    end_station = @stations[@view.ask_for_end_station]
    route = Route.new(starting_station, end_station)
    @routes << route
    puts "Маршрут #{route.name} успешно построен!"
  end

  def route_control
    show_routes
    @route = @routes[@view.ask_which_route]
    choice = @view.ask_what_to_do_with_route
    case choice
    when 1
      show_excluded_stations
      station_index = @view.ask_which_station_to_add
      unless station_index == -1
        @route.add_station(@stations_array[station_index])
        puts "Станция #{@stations_array[station_index].name} добавлена в маршрут #{@route.name}."
        @route.stations
      end
    when 2
      show_included_stations
      station_index = @view.ask_which_station_to_delete
      unless station_index == -1
        @route.delete_station(@stations_array[station_index])
        puts "Станция #{@stations_array[station_index].name} удалена из маршрута #{@route.name}."
        @route.stations
      end
    end
  end

  def set_route
    show_trains
    train = @trains[@view.ask_which_train]
    show_routes
    route = @view.ask_which_route
    train.create_route(@routes[route])
    puts "Поезд №#{train.number} теперь следует маршрутом #{@routes[route].name}"
  end

  def add_carriage_to_train
    show_trains
    train = @trains[@view.ask_which_train]
    add_carriage_condition(train)
    @view.display_carriages_of_train(train)
  end

  def remove_carriage_from_train
    show_trains
    train = @trains[@view.ask_which_train]
    show_carriages(train)
    carriage = train.carriages[@view.ask_which_carriage]
    train.carriage_remove(carriage)
    @view.display_carriages_of_train(train)
  end

  def move_train
    show_trains
    train = @trains[@view.ask_which_train]
    action = @view.ask_where_to_move
    return if action.zero?

    case action
    when 1
      train.move_next_station
    when 2
      train.move_previous_station
    end
    puts "Поезд №#{train.number} теперь на станции #{train.current_station.name}"
  end

  def occupy_wagon
    show_trains
    train = @trains[@view.ask_which_train]
    show_carriages(train)
    carriage = train.carriages[@view.ask_which_carriage]
    if carriage.class == PassengerCarriage
      carriage.take_a_seat
      puts "Место в вагоне №#{carriage.class.number} выбрано. Осталось мест в поезде: #{carriage.free_capacity}"
    elsif carriage.class == CargoCarriage
      capacity = @view.ask_capacity
      carriage.use_capacity(capacity)
      puts "#{capacity}м3 было занято в вагоне №#{carriage.class.number}. Осталось места: #{carriage.free_capacity}м3"
    end
  rescue RuntimeError => e
    puts e.message
    puts 'Попробуйте снова:'
  end

  def show_stations_and_trains
    @stations.each_with_index do |station, index|
      puts "#{index + 1} - #{station.name}"
      puts 'Список поездов:'
      station.trains.each_with_index { |train, train_index| puts "#{train_index + 1}. #{train.number}" }
    end
  end

  def show_station_trains
    show_stations
    station = @stations[@view.ask_which_station]
    block = proc { |train| puts "#{train.class} номер #{train.number}. Кол-во вагонов: #{train.carriages.size}" }
    station.block_station_trains(block)
  end

  def show_train_carriages
    show_trains
    train = @trains[@view.ask_which_train]
    if train.class == PassengerTrain
      block = proc { |carriage| puts "#{carriage.class} номер #{carriage.class.number}. Свободные места: #{carriage.free_capacity}. Занято мест: #{carriage.used_capacity}" }
    elsif train.class == CargoTrain
      block = proc { |carriage| puts "#{carriage.class} номер #{carriage.class.number}. Свободное пространство: #{carriage.free_capacity}м3. Занято грузом: #{carriage.used_capacity}м3" }
    end
    train.block_train_carriages(block)
  end

  private

  # Данные методы логично было бы разместить во View, но т.к. наша БД,
  # по сути, - находится в виде массивов в контроллере - методы поместим
  # в секцию private, т.к. к ним обращаемся только внутри класса.

  def show_stations
    @stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def show_routes
    @routes.each_with_index { |route, index| puts "#{index + 1} - #{route.name}" }
  end

  def show_trains
    @trains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
  end

  def show_excluded_stations
    @stations_array = @stations - @route.stations
    @stations_array.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def show_included_stations
    @stations_array = @stations & @route.stations
    @stations_array.delete(@route.stations[0])
    @stations_array.delete(@route.stations[-1])
    @stations_array.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def show_carriages(train)
    train.carriages.each_with_index { |carriage, index| puts "#{index + 1} - #{carriage.class} №#{carriage.class.number}. Свободное место: #{carriage.free_capacity}" }
  end

  def add_carriage_condition(train)
    if train.class == PassengerTrain
      capacity = @view.ask_passengercarriage_capacity
      train.carriage_add(PassengerCarriage.new(capacity))
      puts "Создан вагон поезда с количеством мест: #{capacity}"
    elsif train.class == CargoTrain
      capacity = @view.ask_cargocarriage_capacity
      train.carriage_add(CargoCarriage.new(capacity))
      puts "Создан вагон поезда объёмом: #{capacity}м3"
    end
  end
end
