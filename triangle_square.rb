puts 'Добрый день, Вас приветствует программа вычисления площади треугольника, пожалуйста, введите основание(а) треугольника в сантиметрах:'
a = gets.chomp.to_f

until a.class == Float && a > 0
  puts "Основание должно быть положительным числом! Повторите ввод:"
  a = gets.chomp.to_f
end

puts 'Введите, пожалуйста, высоту треугольника(h) в сантиметрах:'
h = gets.chomp.to_f

until h.class == Float && h > 0
  puts "Высота должна быть положительным числом! Повторите ввод:"
  h = gets.chomp.to_f
end

square_cm = a * h
square_m = square_cm/100

puts "Высота треугольника в сантиметрах: #{square_cm}см., в метрах: #{square_m}м. Благодарим за использование нашей программы, хорошего Вам дня! :)"

