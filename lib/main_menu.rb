require_relative 'user_login.rb'

def main_menu(user)
  puts "Are you searching by (1) Zip Code or (2) Borough?:"
  search_option = gets.chomp
  puts "Please enter search location:"
  search_input = gets.chomp
  validate_search(user, search_option, search_input)
end


def validate_search(user, search_option, search_input)
  if search_option == "1" && ZipCodes.find_by(zipcode: search_input)
    zipcode_search(user, search_input)
  elsif search_option == "2" && ZipCodes.find_by(borough: search_input)
    borough_search(user)
  else
    puts "Invalid search query created..."
    main_menu(user)
  end
end

def zipcode_search(user, zip)
  puts "There are currently:"
  puts "#{Parks}"
  exit
end

def borough_search(user, search_input)
  puts "I'm searching by borough!"
  exit
end
