require 'sqlite3'
require 'JSON'
require 'pry'

file = File.read("./db/source/NYC_Hiking.json")
hiking_hash = JSON.parse(file)

file = File.read("./db/source/NYC_Parks.json")
parks_hash = JSON.parse(file)

csv = File.read("./db/source/nyc_zipcodes.csv")

CSV.parse(csv, headers: true) do |row|
  db.execute("INSERT INTO, row.fields)
end
