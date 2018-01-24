# array = []

# (10..100).each do |number|
#   array << number if (number % 5).zero?
# end

# Оказывается, есть метод для этого =)
p (10..100).step(5).to_a
