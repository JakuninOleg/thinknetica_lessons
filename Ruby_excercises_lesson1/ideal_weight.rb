puts 'Добрый день, давайте познакомимся, как Вас зовут?'
# После получения информации от юзера форматируем данные, принимая
# во внимание, что пользователь может ввести фамилию и имя
user_name = gets.chomp.downcase.split(" ").map(&:capitalize).join(" ")

puts 'Укажите свой рост:'
user_height = gets.chomp.to_i

ideal_weight = user_height - 110

if  ideal_weight < 0
  puts "#{user_name}, Ваш вес уже идеальный!"
else
  puts "#{user_name}, Ваш идеальный вес - #{ideal_weight}"
end
