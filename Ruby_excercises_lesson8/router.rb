class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    while @running
      display_actions
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  # Данные методы используются внутри класса

  METHODS = { 1 => :create_station,
              2 => :create_train,
              3 => :create_route,
              4 => :route_control,
              5 => :set_route,
              6 => :add_carriage_to_train,
              7 => :remove_carriage_from_train,
              8 => :move_train,
              9 => :show_stations_and_trains,
              10 => :show_train_carriages,
              11 => :show_station_trains,
              12 => :occupy_wagon }.freeze

  def stop
    @running = false
  end

  def route_action(action)
    if !METHODS[action].nil?
      @controller.send METHODS[action]
    elsif action.zero?
      exit
    else
      puts 'Выберите действие повторно'
    end
  end

  def display_actions
    puts '-------------------------------'
    puts '1 - Создать станцию'
    puts '2 - Создать поезд'
    puts '3 - Создать маршрут'
    puts '4 - Управление маршрутом'
    puts '5 - Назначить маршрут поезду'
    puts '6 - Прицепить вагон к поезду'
    puts '7 - Отцепить вагон от поезда'
    puts '8 - Перемещение поезда'
    puts '9 - Список станций'
    puts '10 - Список вагонов поезда'
    puts '11 - Список поездов на станции'
    puts '12 - Занять место в вагоне'
    puts '0 - Выход из программы'
    print '>'
  end
end
