Интересное наблюдение, строка состоящая из одного слова, написанная прописными
буквами не может быть преобразованна методом string.downcase!.capitalize!,
выдавая ошибку  undefined method `capitalize!' for nil:NilClass (NoMethodError),
в то время как строка состоящая из нескольких слов или с заглавной буквой в строке
из одного слова ошибку не вызывает.
