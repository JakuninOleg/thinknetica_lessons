include Math

puts 'Добро пожаловать в программу решения квадратных уравнений'

puts 'Введите первый коэффициент a:'
a = gets.chomp.to_f

puts 'Введите второй коэффициент b:'
b = gets.chomp.to_f

puts 'Введите третий коэффициент c:'
c = gets.chomp.to_f

d = (b ** 2) - (4 * a * c)

puts "Дискриминант: #{d}"

if d < 0
  puts 'Квадратных корней нет'
elsif d == 0
  z = (-b) / (2 * a)
  puts "Корень уравнения: #{z}"
else
  x = ((-b) + Math.sqrt(d))/(2 * a)
  y = ((-b) - Math.sqrt(d))/(2 * a)
  puts "Корень уравнения x1: #{x}, корень уравнения x2: #{y}"
end
