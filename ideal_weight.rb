puts 'Добрый день, давайте познакомимся, как Вас зовут?'
user_name = gets.chomp

# небольшое форматирование введённого имени
user_name.downcase!
user_name.capitalize!

puts 'Укажите свой рост'
user_height = gets.chomp

ideal_weight = user_height.to_i - 110

if  ideal_weight < 0
  puts "#{user_name}, Ваш вес уже идеальный!"
else
  puts "#{user_name}, Ваш идеальный вес - #{ideal_weight}"
end
