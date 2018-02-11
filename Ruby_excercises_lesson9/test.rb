require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

train = Train.new('55555')

train.train_class = 'Эконом'
train.train_class = 'Бизнес'
train.train_class = 'Премиум'

p train.train_class
p train.train_class_history

train.train_color = 'red'

p train.train_color

p train.valid?

# train.train_color = 5
