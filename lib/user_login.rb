require 'pry'
require_relative 'main_menu_interface.rb'


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
    puts "Welcome!"
    new_user_creation
  else
    puts "Invalid Choice."
    login
  end
end
#=====New User Creation====#
def new_user_creation
  puts "Please enter a username:"
  new_username = gets.chomp
  if username_taken?(new_username) == false
    puts "Please enter a password:"
    usr_password = gets.chomp
    puts "Please enter your primary zipcode:"
    usr_zipcode = gets.chomp
  end
    new_user = User.create(name: new_username, password: usr_password, zipcode: usr_zipcode)
    puts "Thank you for creating your account! Soon we will also require your SSN in secure plain text."
    main_menu(new_user)
end

def username_taken?(new_username)
  if User.find_by(name: new_username)
    puts "Username taken. Please try a different name."
    new_user_creation
  else
    false
  end
end



#=====Current User Login=====#
def user_verification(user_name)
  if User.find_by(name: user_name)
    # binding.pry
    found_user = User.find_by(name: user_name)
    password_verification(found_user)
  else
    puts "Invalid User."
    login
  end
end

def password_verification(found_user)
  attempt_counter = 0
  puts
  puts "Welcome back #{found_user.name}!"
  puts "Please enter password:"
  password = gets.chomp
  while attempt_counter < 4
    if found_user.password == password
      puts
      puts "Thank you for logging in #{found_user.name}!"
      main_menu(found_user)
      break
    else
      attempt_counter+=1
      puts "Invalid password. #{5 - attempt_counter} attempt(s) remaining."
      password = gets.chomp
    end #If/Else End
  end #While End
  welcome_message
  login #Returns user to main login screen after too many attempts
end #Def End
