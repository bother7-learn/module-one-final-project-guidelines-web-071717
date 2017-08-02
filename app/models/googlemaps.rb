require 'rest-client'
require 'sanitize'
module GoogleMaps

GEO_KEY = "AIzaSyARIeC1fdPIK5ON7EjAUQHvMZNmgr46i8k"
DISTANCE_KEY = "AIzaSyDjJZ-xa57splIRRFTL8roJFT7T1btHT6M"
DIRECTIONS_KEY = "AIzaSyBDA-1PhyWdIaRCg0lAghiECA04omO42zE"
  def coordinates(address)
    if address.class == Array
    address2 = address.last
    address = address.join(",")
    address = address.delete("(")
    address = address.delete(")")
    end
    x = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{address.to_s},NYC&key=#{GEO_KEY}"
    y = JSON.parse(x)
    if y["results"] == []
        x = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{address2.to_s}&bounds=40.9175771,-73.70027209999999|40.4773991,-74.25908989999999&key=#{GEO_KEY}"
        y = JSON.parse(x)
    end
    y["results"][0]["geometry"]["location"]
  end

  def directions(origin, destination)
    hash = {distance: "", duration: "", directions: []}
    x = RestClient.get "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin["lat"]},#{origin["lng"]}&destination=#{destination["lat"]},#{destination["lng"]}&key=#{DIRECTIONS_KEY}"
    y = JSON.parse(x)
    array = y["routes"][0]["legs"]
    hash[:distance] = array[0]["distance"]["text"]
    hash[:duration] = array[0]["duration"]["text"]
    array[0]["steps"].each do |step|
      step["html_instructions"]
      hash[:directions] << Sanitize.fragment(step["html_instructions"])
    end
    hash
  end


end
