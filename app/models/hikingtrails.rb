require_relative 'googlemaps'


class HikingTrail < ActiveRecord::Base
belongs_to :park
has_many :reviews
has_many :users, through: :reviews
include GoogleMaps

  def self.nearby_trails(user,zipcodes)
    trails_array = []
    usergps = user.geolocation
    Park.nearby_parks(zipcodes).each do |park|
      if park.hiking_trails != nil
        trails_array << park.hiking_trails
      end
    end
    trails_array = trails_array.reject(&:blank?).uniq.flatten
    trails_array.each do |trail|
      trail.average_rating = Review.where(hiking_trail_id: trail.id).average(:rating)
      if trail.average_rating.class == Float
        trail.average_rating = trail.average_rating.round(2)
      end
      if user != nil && trail != nil
        trail.distance = trail.geodistance(usergps, {"lat" => trail.lat, "lng" => trail.lng})
        trail.save
      end
    end
    trails_array.sort_by!(&:distance)
    end

  def geolocation
    self.coordinates([self.name, self.park_name])
  end





end
