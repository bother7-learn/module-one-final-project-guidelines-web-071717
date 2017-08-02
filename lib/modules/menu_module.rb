module Menu
  def main_menu(user)
    puts
    puts "Welcome to the Main Menu."
    puts "Would you like to use your default zipcode? (Y or N)"
    answer = gets.chomp.downcase
    if answer == "y"
      validate_search(user, user.zipcode)
    else
      get_search_zipcode(user)
    end
  end

  def get_search_zipcode(user)
    puts "Please enter search zipcode:"
    search_zipcode = gets.chomp
    validate_search(user, search_zipcode)
  end


  def validate_search(user, search_zipcode)
    if ZipCode.find_by(zipcode: search_zipcode)
      local_information(search_zipcode)
      search_menu(user, search_zipcode)
    else
      puts "Invalid search query created..."
      main_menu(user)
    end
  end

  def local_information(zip)
    nearby_zips = ZipCode.nearby_zipcodes(zip)
    nearby_trails = HikingTrail.nearby_trails([zip])
    borough_trails = HikingTrail.nearby_trails(nearby_zips).flatten

    puts
    puts "Greetings from #{@borough}!"
    puts "There are currently: #{@borough_trails.length} Trail(s) in #{@borough}."
    puts
  end

end
