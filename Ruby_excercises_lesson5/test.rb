require_relative 'company'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'carriage'
require_relative 'route'


train = Train.new(57)
train2 = Train.new(24)

carriage = Carriage.new

p Train.find(57)

p Train.instances

p Route.instances

p Carriage.instances

wvf
