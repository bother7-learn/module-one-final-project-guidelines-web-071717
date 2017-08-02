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
    puts "Sorry, there are no parks near this zipcode."
    puts "Would you like a list of all parks in #{@borough} instead? (Y/N)"
    answer = gets.chomp
    if answer == "Y" || answer == "y"
      borough_toggled_parks
    else
      get_search_zipcode(user)
    end
  end

  puts "Here are the parks most recommended for you:"
  @nearby_parks.flatten.each_with_index { |park, index| puts "#{index + 1}. #{park.name}" }
  puts
  puts "Please pick a park number:"
  park_number = gets.chomp
  chosen_park = @nearby_parks[park_number.to_i - 1]
  puts "Here are directions to the park from your general location"
  directions = chosen_park.directions(user.geolocation, chosen_park.geolocation)
  puts directions_list(directions)
end


def borough_toggled_parks
  puts "Here is the park(s) within #{@borough}:"
  @borough_parks.flatten.each_with_index { |park, index| puts "#{index+1}. #{park.name} "}
  binding.pry
  puts "Please pick a park number:"
  trail_number = gets.chomp
  chosen_park = @borough_parks[trail_number.to_i - 1]
  puts "Here are directions to #{chosen_park} from your general location."
  directions =  chosen_park.directions(user.geolocation, chosen_park.geolocation)
  puts directions_list(directions)
end

#=======Trails Methods==========#

def trail_list(user, zipcode)
  if @nearby_trails.empty?
    puts "Sorry, there are no trails near this zipcode."
    puts "Would you like a list of all trails in #{@borough} instead? (Y/N)"
    answer = gets.chomp
    if answer == "Y" || answer == "y"
      borough_toggled_trails
    else
      get_search_zipcode(user)
    end
  end

  puts "Here are the trails most recommended for you:"
  @nearby_trails.flatten.each_with_index { |trail, index| puts "#{index + 1}. #{trail.name} difficulty: #{trail.difficulty_level}" }
  puts
  puts "Please pick a trail number:"
  trail_number = gets.chomp
  chosen_trail = @nearby_trails[trail_number.to_i - 1]
  puts "Here are directions to #{chosen_trail} from your general location:"
  directions =  chosen_trail.directions(user.geolocation,chosen_trail.geolocation)
  puts directions_list(directions)
end

def borough_toggled_trails
  puts "Here is the trail(s) within #{@borough}:"
  @borough_trails.flatten.each_with_index { |trail, index| puts "#{index+1}. #{trail.name} difficulty: #{trail.difficulty}"}
  binding.pry
  puts "Please pick a trail number:"
  trail_number = gets.chomp
  chosen_trail = @borough_trails[trail_number.to_i - 1]
  puts "Here are directions to #{chosen_trail} from your general location."
  binding.pry
  directions = chosen_park.directions(user.geolocation, chosen_trail.geolocation)
  puts directions_list(directions)
end
