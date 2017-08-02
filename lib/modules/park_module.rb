module Parks
  def park_list(user, zipcode)
    if @nearby_parks.empty?
      puts "Sorry, there are no parks near this zipcode."
      puts "Would you like a list of all parks in #{@borough} instead? (Y/N)"
      answer = gets.chomp
      if answer == "Y" || answer == "y"
        borough_toggled_parks
      else
        get_search_zipcode(user)
      end
    end

    puts "Here are the parks most recommended for you:"
    @nearby_parks.flatten.each_with_index { |park, index| puts "#{index + 1}. #{park.name}" }
    #removed park.distance as park does not currently have a method for distance.
    puts
    puts "Please pick a park number:"
    park_number = gets.chomp
    chosen_park = @nearby_parks[park_number.to_i - 1]
  end


  def borough_toggled_parks
    puts "Here is the park(s) within #{@borough}:"
    @borough_parks.flatten.each_with_index { |park, index| puts "#{index+1}. #{park.name} "}
    # binding.pry
    puts "Please pick a park number:"
    trail_number = gets.chomp
    chosen_park = @borough_parks[trail_number.to_i - 1]
  end

  def directions_list(chosen_park)
    puts "Here are directions to #{chosen_park} from your general location."
    directions =  chosen_park.directions(user.geolocation, chosen_park.geolocation)
    puts directions_list(directions)
  end


def directions_list(user, chosen_trail)
  puts "Please wait, system processing"
  # binding.pry
  directions = chosen_trail.directions(user.geolocation, chosen_trail.geolocation)
  3.times do
    print "."
    sleep(1)
  end
  puts "Here are directions to #{chosen_trail.name} from your chosen kiosk:"
  puts "Distance: #{directions[:distance]}"
  puts "Duration: #{directions[:duration]}"
  directions[:directions].each do |line|
    puts line
    sleep(0.5)
  end
  puts
  puts "Thanks!"
  exit
end

end
