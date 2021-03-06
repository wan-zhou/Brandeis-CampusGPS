# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Outdoor Locations
Room.delete_all
Entrance.delete_all
Floor.delete_all
Building.delete_all
ParkingLot.delete_all
Location.delete_all
Nickname.delete_all

require_relative './seed_data/buildings.rb'
Building.create!(BuildingSeeds::BUILDINGS)

require_relative './seed_data/locations.rb'
Location.create!(LocationSeeds::LOCATIONS)

require_relative './seed_data/parking_lots.rb'
ParkingLot.create!(ParkingLotSeeds::PARKINGLOTS)

puts "Outdoor locations done!"

require_relative './seed_data/floors.rb'
Floor.create!(FloorSeeds::FLOORS)

# require_relative './seed_data/rooms.rb'
# Room.create!(RoomSeeds::ROOMS)

require_relative './seed_data/entrances.rb'
Entrance.create!(EntranceSeeds::ENTRANCES)

require_relative './seed_data/rooms.rb'
Room.create!(RoomSeeds::ROOMS)

puts "Indoor locations done!"

## Outdoor paths and routes

Path.delete_all
require_relative './seed_data/paths.rb'
Path.create!(PathSeeds::PATHS)

puts "Paths done!"

require_relative './seed_data/nicknames.rb'
Nickname.create!(NicknameSeeds::NICKNAMES)

User.delete_all
User.create!(
    name: 'admin',
    password: 'admin',
    password_confirmation: 'admin'
    )
# Import from a csv file if there are too many records to seed