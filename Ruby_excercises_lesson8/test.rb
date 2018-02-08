require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

train = CargoTrain.new('55555')

train2 = PassengerTrain.new('44444')

wagon = CargoCarriage.new(55)
wagon2 = CargoCarriage.new(105)

wagon3 = PassengerCarriage.new(55)
wagon4 = PassengerCarriage.new(105)

wagon.use_capacity(55)

train.carriage_add(wagon)
train.carriage_add(wagon2)

block = proc { |x| puts x.carriage_info + x.free_space_info }

train.block_train_carriages(block)

train2.carriage_add(wagon3)
train2.carriage_add(wagon4)

55.times { wagon3.use_capacity }

block2 = proc { |x| puts x.carriage_info + x.free_space_info }

train2.block_train_carriages(block2)
