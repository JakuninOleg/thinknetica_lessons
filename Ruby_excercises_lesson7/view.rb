class View
  def ask_for_station_name
    puts 'Введите название станции'
    print '>'
    gets.chomp
  end

  def ask_for_train_number
    puts 'Введите номер поезда'
    print '>'
    gets.chomp.to_s
  end

  def ask_for_train_type
    puts 'Выберите тип поезда'
    puts '1 - Пассажирский'
    puts '2 - Грузовой'
    gets.chomp.to_i
  end

  def ask_for_starting_station
    puts 'Выберите начальную станцию'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_for_end_station
    puts 'Выберите конечную станцию'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_which_route
    puts 'Выберите маршрут'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_what_to_do_with_route
    puts 'Выберите действие'
    puts '1 - Добавить станцию'
    puts '2 - Удалить станцию'
    puts '0 - Отмена'
    print '>'
    gets.chomp.to_i
  end

  def ask_which_station
    puts 'Выберите станцию:'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_which_station_to_add
    puts '0 - Отмена'
    puts 'Выберите станцию для добавления в маршрут'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_which_station_to_delete
    puts '0 - Отмена'
    puts 'Выберите станцию маршрута для удаления'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_which_train
    puts 'Выберите поезд'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_which_carriage
    puts 'Выберите вагон'
    print '>'
    gets.chomp.to_i - 1
  end

  def ask_where_to_move
    puts 'Куда едем?'
    puts '1 - Вперёд'
    puts '2 - Назад'
    puts '0 - Отмена'
    print '>'
    gets.chomp.to_i
  end

  def ask_passengercarriage_capacity
    puts "Укажите количество мест в вагоне:"
    print '>'
    gets.chomp.to_i
  end

  def ask_capacity
    puts 'Какой объём вагона занять:'
    print '>'
    gets.chomp.to_f
  end

  def ask_cargocarriage_capacity
    puts "Укажите объём грузового вагона в м3:"
    print '>'
    gets.chomp.to_f
  end

  def display_carriages_of_train(train)
    puts "Количество вагонов у поезда номер #{train.number}: #{train.carriages.size}"
  end
end
