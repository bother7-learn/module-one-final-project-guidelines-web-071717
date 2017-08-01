require_relative 'googlemaps'

class Park < ActiveRecord::Base
has_many :hiking_trails
include GoogleMaps

  def self.nearby_parks(zipcodes)
    park_list = []
    zipcodes.each do |zip|
      self.where("zipcode like (?)", "%#{zip}%").each do |park|
        park_list << park
      end
    end
    park_list.uniq
  end

  def geolocation
    self.coordinates([self.name, self.zipcode])
  end

end
