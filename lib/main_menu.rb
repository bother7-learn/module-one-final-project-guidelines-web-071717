require_relative 'user_login.rb'
def main_menu(user)
  puts "Thank you for logging in #{user.name}!"
  puts "Are you searching by (1) Zip Code or (2) Borough?:"
  search_option = gets.chomp.to_i
  puts "Please enter search location:"
  search_input = gets.chomp
  validate_search(search_option, search_input)
end


def validate_search(search_option, search_input)
 
end
