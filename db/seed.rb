require 'sqlite3'
require 'JSON'
require 'pry'

DB[:conn].execute("DROP TABLE IF EXISTS hikingtrails")
DB[:conn].execute("DROP TABLE IF EXISTS parks")
DB[:conn].execute("DROP TABLE IF EXISTS zipcodes")


file = File.read("./db/source/NYC_Hiking.json")
hiking_hash = JSON.parse(file)

file = File.read("./db/source/NYC_Parks.json")
parks_hash = JSON.parse(file)

csv = File.read("./db/source/nyc_zipcodes.csv")

CSV.parse(csv, headers: true) do |row|
  DB[:conn].execute("INSERT INTO zipcodes (zipcode, borough) VALUES (?, ?)", row.fields)
end

Pry.start
