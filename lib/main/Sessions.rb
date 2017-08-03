require 'pry'
require 'io/console'

class Session
  include Login, Trails, Menu
  attr_accessor :current_user, :borough, :chosen_zip

  def initialize(current_user = "", borough = "")
    @current_user = current_user
    welcome_message
  end

  def welcome_message
    puts 'Welcome to the NYC Hiking Trail Kiosk!'
  end

  def search_menu
    get_zip_menu(@current_user, @current_user.zipcode)
  end

  def show_trails(picked_zip)
    @borough = ZipCode.get_borough(picked_zip)
    borough_trails = local_information(@current_user,@borough, picked_zip)
    trail_list(@current_user, borough_trails)
  end

  def renew_session
    puts
    puts "Would you like to find another trail?"
    puts "Please type in 'Yes' to start a search in the last location"
    puts "Please type in 'New' to start a new search"
    puts "From here, you may logout by typing 'No' or 'Logout'"
    session_choice
  end

  def session_choice
    answer = gets.chomp.capitalize
    case answer
    when "Yes"
      last_zip = @chosen_zip
      show_trails(last_zip)
    when 'New'
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
    puts
    @current_user = ""
    sleep(1)
    system "clear"
    welcome_message
    @current_user = attempt_login
  end
end
