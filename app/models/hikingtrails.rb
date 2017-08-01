require_relative 'googlemaps'


class HikingTrail < ActiveRecord::Base
belongs_to :park
has_many :reviews
has_many :users, through: :reviews
include GoogleMaps

  def self.nearby_trails(zipcodes)
    trails_array = []
    Park.nearby_parks(zipcodes).each do |park|
      if park.hiking_trails != nil
        trails_array << park.hiking_trails
      end
    end
    trails_array.reject(&:blank?)
  end

  def geolocation
    self.coordinates([self.name, self.park_name])
  end




end
