puts 'Добро пожаловать в программу определения порядкового номера даты. Введите день:'
user_date = gets.chomp.to_i

puts Введите месяц:
user_month = gets.chomp.to_i

puts Введите год:
user_year = gets.chomp.to_i

days_in_month_array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (user_year % 400).zero? || ((user_year % 4).zero? && user_year % 100 != 0)
  days_in_month_array[1] = 29
end

# Чтобы получить результат, мы вычитаем 2 из заданного пользователем месяца
# (из-за начала отсчёта массива с 0 и чтобы не учитывать неполный месяц)
# и прибавляем заданную дату
result = days_in_month_array[0..user_month - 2].reduce(:+) + user_date

puts "Порядковый номер даты #{user_date}.#{user_month}.#{user_year} - #{result}"
