puts 'Добрый день, Вас приветствует программа, которая поможет Вам опознать прямоугольный треугольник. Для начала - введите любую из 3х сторон вашего треугольника в сантиметрах:'
a = gets.chomp.to_f

puts 'Введите вторую сторону треугольника в сантиметрах:'
b = gets.chomp.to_f

puts 'Введите третью сторону треугольника в сантиметрах:'
c = gets.chomp.to_f

# Если все стороны равны - дадим ответ и завершим программу
if a == b && b == c
  puts 'Ваш треугольник равносторонний, да ещё и равнобедренный! Но не прямоугольный, увы!'
  exit
end
# Создадим массив из всех полученных сторон треугольника
array = [a, b, c]
# Находим гипотенузу, выбирая наибольшую сторону из массива
hypotenuse = array.max
# Удаляем гипотенузу, чтобы в массиве осталось только 2 катета.
array.delete(hypotenuse)
# Создадим переменную, чтобы не повторять вычисления несколько раз в наших
# conditional statements, соблюдаем философию Keep it DRY
right_triangle = (hypotenuse**2 == array.first**2 + array.last**2)

if right_triangle && array.first == array.last
  puts 'Ваш треугольник прямоугольный и равнобедренный! Бинго!'
elsif right_triangle
  puts 'Ваш треугольник прямоугольный! Ура!'
else
  puts 'К сожалению, Ваш треугольник не прямоугольный'
end



