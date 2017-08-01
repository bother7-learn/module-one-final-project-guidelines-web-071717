require_relative 'main_menu_interface.rb'

def search_menu(user,zipcode)
  puts
  puts "Would you like to search for a park or trail?"
  choice = gets.chomp
  puts @nearby_parks.length
  puts @nearby_trails.length
  puts @borough_parks.length
  puts @borough_trails.length
end
