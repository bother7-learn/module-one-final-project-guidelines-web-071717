require_relative 'user_login.rb'
require_relative 'search_menu.rb'

def main_menu(user)
  puts
  puts "Welcome to the Search Menu."
  puts "Would you like to use your default zipcode? (Y or N)"
  answer = gets.chomp
  if answer == "Y"
    validate_search(user, user.zipcode)
  else
    puts "Please enter search zipcode:"
    search_zipcode = gets.chomp
    validate_search(user, search_zipcode)
  end
end


def validate_search(user, search_zipcode)
  if ZipCode.find_by(zipcode: search_zipcode)
    local_information(search_zipcode)
    search_menu(user, search_zipcode)
  else
    puts "Invalid search query created..."
    main_menu(user)
  end
end

# def zipcode_search(user, zip)
#   local_information(zip)
#   puts "What would you like to search today?"
#   puts "1. Parks"
#   puts "2. Hiking Trails"
#   choice = gets.chomp
# end

def local_information(zip)
  borough = ZipCode.get_borough(zip)
  nearby_zips = ZipCode.nearby_zipcodes(zip)
  @nearby_parks = Park.nearby_parks(zip.to_s.split) #Integer to Array Magic.
  @nearby_trails = HikingTrail.nearby_trails(zip.to_s.split) #Integer to Array Magic.
  @borough_parks = Park.nearby_parks(nearby_zips)
  @borough_trails = HikingTrail.nearby_trails(nearby_zips)

  puts
  puts "Greetings from #{borough}!"
  puts "There are currently: #{@nearby_parks.length} Parks in your immediate area."
  puts "There are currently: #{@nearby_trails.length} Trails in your immediate area."
  puts "There are currently: #{@borough_parks.length} Parks in #{borough}."
  puts "There are currently: #{@borough_trails.length} Trails in #{borough}."
  puts
end
