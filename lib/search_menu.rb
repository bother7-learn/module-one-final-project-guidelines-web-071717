require_relative 'main_menu_interface.rb'
# @nearby_parks = Park.nearby_parks(zip.to_s.split) #Integer to Array Magic.
# @nearby_trails = HikingTrail.nearby_trails(zip.to_s.split) #Integer to Array Magic.


def search_menu(user,zipcode)
  puts
  puts "Would you like to search for a (1)park or (2)trail?"
  choice = gets.chomp
  case choice
  when "1"
    park_list(user,zipcode)
  when "2"
    trail_list(user, zipcode)
  else
    puts "Invalid option, please enter 1 or 2"
    search_menu(user, zipcode)
  end
end

def park_list(user, zipcode)
  if @nearby_parks.empty?
    puts "Sorry, there are no parks near this zipcode. Please enter a new zipcode"
    get_search_zipcode
  end

  puts "Here are the parks most recommended for you:"
  @nearby_parks.each_with_index { |park, index| puts "#{index + 1}. #{park.name}" }
  puts
  puts "Please pick a park number:"
  park_number = gets.chomp
  chosen_park = @nearby_parks[park_number.to_i - 1]
  puts "Here are directions to the park from your general location"
  puts chosen_park.directions(user.geolocation,chosen_park.geolocation)
end

def trail_list(user, zipcode)
  if @nearby_trails.empty?
    puts "Sorry, there are no trails near this zipcode. Please enter a new zipcode"
    get_search_zipcode
  end

  puts "Here are the trails most recommended for you:"
  @nearby_trails.each_with_index { |park, index| puts "#{index + 1}. #{park.name}" }
  puts
  puts "Please pick a trail number:"
  trail_number = gets.chomp
  chosen_trail = @nearby_trails[trail_number.to_i - 1]
  puts "Here are directions to #{chosen_trail} from your general location."
  puts chosen_trail.directions(user.geolocation,chosen_trail.geolocation)
end
