require 'pry'
require 'io/console'

class Session
  include Login, Trails, Parks, Menu
  attr_accessor :current_user, :park_or_trail, :borough

  def initialize(current_user = "")
    @current_user = current_user
    @borough = ZipCode.get_borough(@current_user.zip)
    welcome_message
  end

  def welcome_message
    puts 'Welcome to the NYC Hiking Trail Kiosk!'
  end

  def park_or_trail?
    puts "Are you looking for a Park or Trail?"
    answer = gets.chomp.downcase
    case answer
    when "park"
      @park_or_trail = answer
    when "trail"
      @park_or_trail = answer
    else
      puts "Invalid answer"
      park_or_trail?
    end
  end

  def search
    case @park_or_trail
    when "park"
      park_list(@current_user, @current_user.zipcode)
    when "trail"
      trail_list(@current_user, @current_user.zipcode)
    end
  end

  def search_menu
    main_menu(@current_user)
  end

end
