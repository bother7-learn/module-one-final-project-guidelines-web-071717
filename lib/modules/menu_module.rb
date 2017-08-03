module Menu
  def get_zip_menu(user, zipcode)
    puts
    puts "Welcome to the Main Menu."
    puts "Would you like to use your default zipcode? (Y or N)"
    answer = gets.chomp.capitalize
    case answer
    when "Y"
      validate_search(user, zipcode)
    when "N"
      get_search_zipcode(user)
    else
      puts "Invalid choice."
      get_zip_menu(user)
    end
  end

  def get_search_zipcode(user)
    puts "Please enter search zipcode:"
    search_zipcode = gets.chomp
    validate_search(user, search_zipcode)
  end


  def validate_search(user, chosen_zipcode)
    if ZipCode.find_by(zipcode: chosen_zipcode)
      return chosen_zipcode
    else
      puts "Invalid search query created..."
      get_zip_menu(user, user.zipcode)
    end
  end

end
