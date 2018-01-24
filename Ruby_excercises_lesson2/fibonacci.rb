fibonacci_array = [0, 1]

# index = 0

# until fibonacci_array.last >= 100
#   fibonacci_array_calculation = fibonacci_array[index] + fibonacci_array.last
#

#   Подразумеваем, что мы не знаем ряд фибоначчи,
#   потому не добавим цифру более 100 в массив

#   break if fibonacci_array_calculation > 100
#   fibonacci_array << fibonacci_array_calculation
#   index += 1
# end

# Выполним рефакторинг для уменьшения количества строк

until fibonacci_array[-1] + fibonacci_array[-2] > 100
  fibonacci_array << fibonacci_array[-1] + fibonacci_array[-2]
end

p fibonacci_array
