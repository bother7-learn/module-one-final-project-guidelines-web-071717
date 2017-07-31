require 'sqlite3'
require 'JSON'
require 'pry'
require_relative '../config/environment'
require 'CSV'

HikingTrails.delete_all
ZipCodes.delete_all
Parks.delete_all
Users.delete_all

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

<<<<<<< HEAD
kesean = Users.create(name: 'Kesean', password: '0609', zipcode: 10022)
Pry.start
=======
HikingTrails.all.each do |trail|
  if trail.difficulty == "Easy"
    trail.difficulty_level = 2
  elsif trail.difficulty == "Easy/Moderate"
    trail.difficulty_level = 3
  elsif trail.difficulty == "Moderate"
    trail.difficulty_level = 4
  elsif trail.difficulty == "Moderate/Difficult"
    trail.difficulty_level = 5
  elsif trail.difficulty == "Difficult"
    trail.difficulty_level = 6
  else
    trail.difficulty_level = 1
  end
  trail.save
end

# Pry.start
>>>>>>> 83e0bd5f4b1786c1dd89e243b5b96d45c5e0fbd8
