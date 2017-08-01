require_relative 'user_login.rb'

def main_menu(user)
  puts "Welcome to the Search Menu."
  puts "Would you like to use your default zipcode? (Y or N)"
  answer = gets.chomp
  if answer == "Y"
    validate_search(user, "1", user.zipcode)
  else
    puts "Are you searching by (1) Zip Code or (2) Borough?:"
    search_option = gets.chomp
    puts "Please enter search location:"
    search_input = gets.chomp
    validate_search(user, search_option, search_input)
  end
end


def validate_search(user, search_option, search_input)
  if search_option == "1" && ZipCode.find_by(zipcode: search_input)
    zipcode_search(user, search_input)
  elsif search_option == "2" && ZipCode.find_by(borough: search_input)
    borough_search(user)
  else
    puts "Invalid search query created..."
    main_menu(user)
  end
end

def zipcode_search(user, zip)
  borough = ZipCode.get_borough(zip)
  nearby_zips = ZipCode.nearby_zipcodes(zip)
  nearby_parks = Park.all.select { |park| nearby_zips.include?(park.zipcode) }
  binding.pry
  puts "Greetings from #{borough}!"
  puts "There are currently: Parks!"
  exit
end

def borough_search(user, search_input)
  puts "I'm searching by borough!"
  exit
end
