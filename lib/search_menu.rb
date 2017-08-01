require_relative 'main_menu_interface.rb'

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
  
end

def trail_list(user, zipcode)
end
