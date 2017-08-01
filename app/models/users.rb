require_relative 'googlemaps'

class User < ActiveRecord::Base
has_many :reviews
has_many :hiking_trails, through: :reviews


include GoogleMaps

  def add_review(hiking_trail, desc)
    Review.new(self, hiking_trail, desc)
  end

end
