module Trails

  def local_information(user,borough, zip)
    puts "Please wait, system processing"
    4.times do
      print "."
      sleep(1)
    end
    nearby_zips = ZipCode.nearby_zipcodes(zip)
    borough_trails = HikingTrail.nearby_trails(user,nearby_zips)
    puts
    puts "Greetings from #{borough}!"
    puts "There are currently: #{borough_trails.length} Trail(s) in #{borough}."
    puts
    return borough_trails
  end

  def trail_list(user, local_trails)
    # binding.pry
    puts "Here are the trails most recommended for you:"
    local_trails.flatten.each_with_index do |trail, index|
      puts "|#{index + 1}. #{trail.name}|   |Avg Rating: #{trail.average_rating}|   |Difficulty: #{trail.difficulty}|   |Distance From You: #{trail.distance}|"
    end
    puts "Please pick a trail number:"
    trail_number = gets.chomp
    if trail_number.to_i > local_trails.length
      puts "Invalid trail number.."
      puts
      trail_list(user, local_trails)
    end
    chosen_trail = local_trails[trail_number.to_i - 1]
    puts "Would you like to see (1) Directions or (2) Reviews for #{chosen_trail.name}?"
    choice = gets.chomp
    case choice
    when "1"
      directions_list(user, chosen_trail)
    when "2"
      reviews(user, chosen_trail)
    else
      puts "Invalid choice..."
      trail_list(user, local_trails)
    end
  end

  def directions_list(user, chosen_trail)
    puts "Please wait, system processing"
    # binding.pry
    directions = chosen_trail.directions(user.geolocation, chosen_trail.geolocation)
    4.times do
      print "."
      sleep(1)
    end
    puts
    puts "Here are directions to #{chosen_trail.name} from your chosen kiosk:"
    puts "Distance: #{directions[:distance]}"
    puts "Duration: #{directions[:duration]}"
    directions[:directions].each do |line|
      puts line
      sleep(0.5)
    end
    return
  end

  def reviews(user, chosen_trail)
    puts
    puts "Reviews for #{chosen_trail.name}:"

    if chosen_trail.reviews.empty?
      puts "No reviews for #{chosen_trail.name}."
    else
      chosen_trail.reviews.each do |review|
          sleep(0.5)
            puts "#{User.find(review.user_id).name} - Rating:#{review.rating} - #{review.desc} "
        end
    end

    puts "Would you like to add a review to #{chosen_trail.name}? (Yes/No)"
    answer = gets.chomp.capitalize

    case answer
    when "Yes", "Y"
      new_review(user, chosen_trail)
    else
      #magical break
    end

  end

  def new_review(user, chosen_trail)
    puts "Please add a rating between 1 - 5"
    rating = gets.chomp
    loop do
      if rating.to_i <= 0 || rating.to_i > 5
        puts "Invalid Rating..."
        puts "Please add a rating between 1 - 5"
        rating = gets.chomp
      else
        break
      end
    end
    puts "Please add review description: "
    trail_description = gets.chomp
    user.add_review(trail_description, chosen_trail, rating)
    puts "Review Added."
    return
  end

end
