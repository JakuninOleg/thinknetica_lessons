cart = {}
sum_array = []

puts 'Добро пожаловать в программу рассчёта стоимости покупок.'

loop do
  puts 'Введите наименование товара (для завершения покупок наберите стоп):'
  item = gets.chomp.downcase.capitalize
  break if item == 'Стоп'
  puts 'Введите количество:'
  quantity = gets.chomp.to_f
  puts 'Введите цену товара:'
  price = gets.chomp.to_f

  cart[item] = { quantity => price }

  sum_array << quantity * price
end

p cart

cart.each do |item, nested_hash|
  sum = 0
  nested_hash.each { |quantity, price| sum = quantity * price }
  puts "Итого стоимость товара #{item}: #{sum}$"
end

result = sum_array.reduce(:+)

puts "Итого: #{result}$"

# В принципе, код мне нравится, но, интересно - можно ли зарефакторить красивее?
