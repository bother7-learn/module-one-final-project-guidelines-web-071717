require 'pry'
def welcome_message
  puts "Welcome to the NYC Trail Recommendation System!"
end

def menu
  puts " Please select from the following menu:
  1) Trails Near Me
  2) Trails By Borough
  3) Advanced Search
  4) NYC Trail Facts
  5) Exit"
  user_choice = gets.chomp.to_i
  if valid_menu_choice?(user_choice)
    action(user_choice)
  else
    menu
  end

end

def valid_menu_choice?(choice)
  menu_options = [1,2,3,4,5]
  menu_options.include?(choice)
end

def action(user_choice)

end
