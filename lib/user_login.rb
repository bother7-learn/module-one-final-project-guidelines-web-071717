require 'pry'
require_relative '../app/models/users.rb'
require_relative 'main_menu.rb'


# Main menu of the interface that holds all the functions being executed from run.rb.
# Asks user to sign into account to link reviews, then filter trails by zip or borough.

def welcome_message
  puts 'Welcome to the NYC Hiking Trail System!'
end

def login
  puts 'Press 1 to login to an existing account, or 2 to create a new account:'
  user_account_choice = gets.chomp.to_i
  verify_user(user_account_choice)
end

def verify_user(user_account_choice)
  case user_account_choice
  when 1
    puts "Please enter username:"
    user_name = gets.chomp
    user_verification(user_name)
  when 2
    #New Account Creation Todo
  else
    puts "Invalid Choice."
    login
  end
end

def user_verification(user_name)
  if Users.find_by(name: user_name)
    # binding.pry
    found_user = Users.find_by(name: user_name)
    password_verification(found_user)
  else
    puts "Invalid User."
    login
  end
end

def password_verification(found_user)
  attempt_counter = 0
  puts "Welcome back #{found_user.name}!"
  puts "Please enter password:"
  password = gets.chomp
  while attempt_counter < 5
    ###Todo
  end
  main_menu(found_user)
end
