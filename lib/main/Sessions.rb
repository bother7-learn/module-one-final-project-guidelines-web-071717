require 'pry'
require 'io/console'

class Session
  include Login, Trails, Menu
  attr_accessor :current_user, :borough

  def initialize(current_user = "", borough = "")
    @current_user = current_user
    welcome_message
  end

  def welcome_message
    puts 'Welcome to the NYC Hiking Trail Kiosk!'
  end

  def search_menu
    get_zip_menu(@current_user)
  end

  def show_trails(chosen_zip)
    @borough = ZipCode.get_borough(chosen_zip)
    borough_trails = local_information(@borough, chosen_zip)
    trail_list(@current_user, borough_trails)
  end

  def renew_session
    puts
    puts "Would you like to find another trail?:"
    puts "From here, you may logout by typing 'no' or 'logout' "
    session_choice
  end

  def session_choice
    answer = gets.chomp.capitalize
    case answer
    when "Yes"
      #Magical break
    when "No"
      logout
    when "Logout"
      logout
    else
      puts "unknown choice, please try again"
      renew_session
    end
  end

  def logout
    puts "Thank you for using our system!"
    @current_user = ""
    welcome_message
    binding.pry
    @current_user = attempt_login
  end
end
