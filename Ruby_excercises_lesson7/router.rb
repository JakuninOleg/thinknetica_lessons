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

  def stop
    @running = false
  end

  def route_action(action)
    case action
    when 1 then @controller.create_station
    when 2 then @controller.create_train
    when 3 then @controller.create_route
    when 4 then @controller.route_control
    when 5 then @controller.set_route
    when 6 then @controller.add_carriage_to_train
    when 7 then @controller.remove_carriage_from_train
    when 8 then @controller.move_train
    when 9 then @controller.show_stations_and_trains
    when 10 then @controller.show_train_carriages
    when 11 then @controller.show_station_trains
    when 12 then @controller.occupy_wagon
    when 0 then stop
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
