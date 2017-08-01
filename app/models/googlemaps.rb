require 'rest-client'

module GoogleMaps

GEO_KEY = "AIzaSyARIeC1fdPIK5ON7EjAUQHvMZNmgr46i8k"
DISTANCE_KEY = "AIzaSyDjJZ-xa57splIRRFTL8roJFT7T1btHT6M"
DIRECTIONS_KEY = "AIzaSyBDA-1PhyWdIaRCg0lAghiECA04omO42zE"
  def coordinates(address)
    if address.class == Array
    address = address.join(",")
    end
    x = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{address.to_s},NYC&key=#{GEO_KEY}"
    y = JSON.parse(x)
    y["results"][0]["geometry"]["location"]
  end

  def directions(origin, destination)
<<<<<<< HEAD
    # hash = {distance:, duration:, directions: []}
=======
    hash = {distance: "", duration: "", directions: []}
>>>>>>> Joe
    x = RestClient.get "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin["lat"]},#{origin["lng"]}&destination=#{destination["lat"]},#{destination["lng"]}&key=#{DIRECTIONS_KEY}"
    y = JSON.parse(x)
    array = y["routes"][0]["legs"]
    hash[:distance] = array[0]["distance"]["text"]
    hash[:duration] = array[0]["duration"]["text"]
    array[0]["steps"].each do |step|
      hash[:directions] << step["html_instructions"]
    end
    hash
  end


end
