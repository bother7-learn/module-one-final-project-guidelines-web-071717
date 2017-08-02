require_relative 'googlemaps'

class Park < ActiveRecord::Base
has_many :hiking_trails
include GoogleMaps

  def self.nearby_parks(zipcodes, user=nil)
    if user != nil
      usergps = user.geolocation
    end
    park_list = []
    zipcodes.each do |zip|
      self.where("zipcode like (?)", "%#{zip}%").each do |park|
        if user != nil
          parkgps = park.geolocation
          park.distance = park.geodistance(usergps, parkgps)
          park.save
        end
        park_list << park
      end
    end
    park_list.uniq.sort_by!(&:distance)
  end

  def geolocation
    self.coordinates([self.name, self.zipcode])
  end

end
