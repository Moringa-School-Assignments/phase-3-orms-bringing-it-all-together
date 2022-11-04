require 'bundler'
Bundler.require

require_relative '../lib/dog'

DB = { conn: SQLite3::Database.new("../db/dogs.db") }
# props = {
#     name: "James",
#     breed: "Oscar",
#     id: nil
# }

# obj = Dog.new(name: "James", breed: "Oscar", id: nil)
obj = Dog.new(name: "Carter", breed: "Punjabi", id: nil)

p obj.breed
# Dog.create_table
p Dog.find_by_name "James"
p Dog.find 2

# obj.save "James"

