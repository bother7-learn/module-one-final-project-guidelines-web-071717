require_relative 'googlemaps'

class User < ActiveRecord::Base
has_many :reviews
has_many :hiking_trails, through: :reviews


include GoogleMaps

  def add_review(description, hike)
    x = Review.create(:desc => description, :hiking_trail => hike, :user => self)
    # x.desc = description
    # x.user = self
    # x.hiking_trail = hike
    # x.save
  end

end
