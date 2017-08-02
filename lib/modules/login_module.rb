module Login


  def attempt_login
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
      attempt_login
    end
  end
  #=====New User Creation====#
  def new_user_creation

    puts "Please enter a username:"
    new_username = gets.chomp.capitalize
    if username_taken?(new_username) == false
      puts
      validated_password = password_validation
      puts
      validated_zipcode = zipcode_validation
    end

    new_user = User.create(name: new_username, password: validated_password, zipcode: validated_zipcode)
    puts "Thank you for creating your account! Soon we will also require your SSN in secure plain text."
  end


  def username_taken?(new_username)
    if new_username == "nil"
      puts "Invalid Username, please enter a valid username"
      new_user_creation
    elsif User.find_by(name: new_username.capitalize)
      puts "Username taken. Please try a different name."
      new_user_creation
    else
      false
    end
  end


  def password_validation
    puts "Enter a password of your choice."
    puts "Passwords must be at least 4 characters/numbers & up to 10."
    puts "Warning: Passwords can not be reset currently."
    password_attempt = STDIN.noecho(&:gets).chomp
    if password_attempt == "nil" || (4..10).to_a.include?(password_attempt.length) == false
      puts "Invalid Password..please try again"
      puts
      password_validation
    end
    return password_attempt
  end

  def zipcode_validation
    puts "Please enter your primary zipcode:"
    usr_zipcode = gets.chomp
    nyc_zipcodes = ZipCode.all.map { |zipcode_obj| zipcode_obj.zipcode  }
    if nyc_zipcodes.include?(usr_zipcode) == false || usr_zipcode == "nil"
      puts "Invalid ZipCode, please enter a valid NYC zipcode."
      puts
      zipcode_validation
    end
    return usr_zipcode
  end



  #=====Current User Login=====#
  def user_verification(user_name)
    if User.find_by(name: user_name)
      # binding.pry
      found_user = User.find_by(name: user_name)
      password_verification(found_user)
    else
      puts "Invalid User."
      attempt_login
    end
  end

  def password_verification(found_user)
    attempt_counter = 0
    puts
    puts "Welcome back #{found_user.name}!"
    puts "Please enter password:"
    password = STDIN.noecho(&:gets).chomp
    while attempt_counter < 4
      if found_user.password == password
        puts
        puts "Thank you for logging in #{found_user.name}!"
        return found_user
        break
      else
        attempt_counter+=1
        puts "Invalid password. #{5 - attempt_counter} attempt(s) remaining."
        password = STDIN.noecho(&:gets).chomp
      end #If/Else End
    end #While End
    welcome_message
    attempt_login #Returns user to main login screen after too many attempts
  end #Def End

end
