require_relative 'googlemaps'

class User < ActiveRecord::Base
has_many :reviews
has_many :hiking_trails, through: :reviews


include GoogleMaps

  def add_review(description, hike)
    x = Review.create(:desc => description, :hiking_trail => hike, :user => self)
  end

  def geolocation
    self.coordinates([self.zipcode])
  end

end
