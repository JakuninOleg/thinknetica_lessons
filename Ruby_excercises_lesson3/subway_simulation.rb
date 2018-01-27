require_relative 'station'
require_relative 'route'
require_relative 'train'

station_one = Station.new('Ботаническая')
station_two = Station.new('Проспект космонавтов')
station_three = Station.new('Автовокзал')

route = Route.new(station_one, station_two)

route.add_station(station_three)

train = Train.new('24', 'грузовой', 25)

p route.route_name

train.create_route(route)

p train.current_station.name
p train.next_station.name
p train.previous_station

train.move_next_station
p '------'
p 'поехали'

p train.current_station.name
p train.next_station.name
p train.previous_station.name
p route.stations

train.move_next_station
p '------'
p 'поехали'

p train.current_station.name
p train.next_station
p train.previous_station.name
p route.stations

train.move_previous_station
p '------'
p 'поехали назад'

p train.current_station.name
p train.next_station.name
p train.previous_station.name
p route.stations

train.move_previous_station
p '------'
p 'поехали назад'

p train.current_station.name
p train.next_station.name
p train.previous_station
p route.stations

