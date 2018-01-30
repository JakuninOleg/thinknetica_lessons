class View
  def ask_for_station_name
    puts 'Введите название станции'
    print '>'
    gets.chomp
  end

  def ask_for_train_number
    puts 'Введите номер поезда'
    print '>'
    gets.chomp
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

  def ask_what_to_do_with_carriages
    puts 'Что сделать с поездом'
    puts '1 - Добавить вагоны'
    puts '2 - Отцепить вагоны'
    print '>'
    gets.chomp.to_i
  end

  def ask_how_many_carriages
    puts 'Сколько вагонов?'
    print '>'
    gets.chomp.to_i
  end

  def ask_where_to_move
    puts 'Куда едем?'
    puts '1 - Вперёд'
    puts '2 - Назад'
    puts '0 - Отмена'
    print '>'
    gets.chomp.to_i
  end
end
