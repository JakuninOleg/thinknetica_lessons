# Учу английский с детства, а сегодня узнал что 'y' не всегда считается гласной =)
vowels = %(a e i o u y)

letters = ('a'..'z').to_a

vowels_hash = {}

# Ищем в массиве letters буквы соответствующие массиву vowels и заносим
# в хэш vowels_hash, присваивая индекс элемента из массива letters.
# Метод each_with_index длиннее на 2 символа, но, возможно, предпочтительнее
# использовать именно его. Уточнить.
letters.each { |letter| vowels_hash[letter] = letters.index(letter) + 1 if vowels.include?(letter) }

p vowels_hash
