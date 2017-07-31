require 'pry'
require_relative '../app/models/user.rb'


# Main menu of the interface that holds all the functions being executed from run.rb.
# Asks user to sign into account to link reviews, then filter trails by zip or borough.
@current_user = nil

def welcome_message
  puts 'Welcome to the NYC Hiking Trail System!'
end

def login
  puts 'Press 1 to login to an existing account, or 2 to create a new account:'
  user_account_choice = gets.chomp
  verify_user_choice(user_account_choice)
  main_menu
end

def verify_user_choice(user_account_choice)
  case user_account_choice.to_i
  when 1
    puts "Please enter username:"
    @current_user = gets.chomp
  when 2
    puts "Please enter chosen name:"
    @current_user = gets.chomp
  else
    puts "Invalid Choice."
    puts
    login
  end
end

#=============Main Options====================#

def main_menu
  puts "Hello #{@current_user}!"
  puts "Are you searching by (1) Zip Code or (2) Borough?:"
  search_option = gets.chomp.to_i
  puts "Please enter search location:"
  search_input = gets.chomp
  validate_search(search_option, search_input)
end


def validate_search()
