require 'sqlite3'
require 'JSON'
require 'pry'
require_relative '../config/environment'
require 'CSV'

HikingTrail.delete_all
ZipCode.delete_all
Park.delete_all
User.delete_all

# "Prop_ID", "Name", "Location", "Park_Name", "Length", "Difficulty",
# "Other_Details", "Accessible", "Limited_Access", "lat", "lon"
file = File.read("./db/source/NYC_Hiking.json")
hiking_array = JSON.parse(file)
  hiking_array.each do |hash|
    HikingTrail.new({name: hash["Name"], location: hash["Location"], park_name: hash["Park_Name"], length: hash["Length"], difficulty: hash["Difficulty"], other_details: hash["Other_Details"]}).save
  end

file = File.read("./db/source/NYC_Parks.json")
parks_array = JSON.parse(file)
  parks_array.each do |hash|
    Park.new({name: hash["Name"], location: hash["Location"], zipcode: hash["Zip"]}).save
  end

csv = File.read("./db/source/nyc_zipcodes.csv")

CSV.parse(csv, headers: true) do |row|
  ZipCode.new({zipcode: row[0], borough: row[1]}).save
end


kesean = User.create(name: 'Kesean', password: '0609', zipcode: 10022)
joe = User.create(name: 'Joe', password: '0000', zipcode: 10024)


joe.add_review("awesome", HikingTrail.all[2])
joe.add_review("not good", HikingTrail.all[8])
joe.add_review("totes amazeballs", HikingTrail.all[27])
kesean.add_review("10 out of 10", HikingTrail.all[2])
kesean.add_review("this hike displeases me", HikingTrail.all[19])
kesean.add_review("the best hike I have ever been on in the history of time", HikingTrail.all[12])


HikingTrail.all.each do |trail|
  x = Park.find_by(name: trail.park_name)
  if x != nil
  trail.park = x
  trail.save
  end
end

HikingTrail.all.each do |trail|
  x = trail.geolocation
  trail.lat = x["lat"]
  trail.lng = x["lng"]
  trail.save
end

HikingTrail.all.each do |trail|
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
    trail.difficulty_level = "Unknown"
    trail.difficulty = "Undetermined"
  end
  trail.save
end

# Pry.start
