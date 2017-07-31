require 'sqlite3'
require 'JSON'
require 'pry'
require_relative '../config/environment'
require 'CSV'

HikingTrails.delete_all
ZipCodes.delete_all
Parks.delete_all

# "Prop_ID", "Name", "Location", "Park_Name", "Length", "Difficulty",
# "Other_Details", "Accessible", "Limited_Access", "lat", "lon"
file = File.read("./db/source/NYC_Hiking.json")
hiking_array = JSON.parse(file)
  hiking_array.each do |hash|
    HikingTrails.new({name: hash["Name"], location: hash["Location"], park_name: hash["Park_Name"], length: hash["Length"], difficulty: hash["Difficulty"], other_details: hash["Other_Details"]}).save
  end

file = File.read("./db/source/NYC_Parks.json")
parks_array = JSON.parse(file)
  parks_array.each do |hash|
    Parks.new({name: hash["Name"], location: hash["Location"], zipcode: hash["Zip"]}).save
  end

csv = File.read("./db/source/nyc_zipcodes.csv")

CSV.parse(csv, headers: true) do |row|
  ZipCodes.new({zipcode: row[0], borough: row[1]}).save
end

Pry.start
