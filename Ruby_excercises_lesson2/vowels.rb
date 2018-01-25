# Учу английский с детства, а сегодня узнал что 'y' не всегда считается гласной =)
vowels = %(a e i o u y)

letters = ('a'..'z').to_a

vowels_hash = {}

letters.each_with_index { |letter, index| vowels_hash[letter] = index + 1 if vowels.include?(letter) }

p vowels_hash
