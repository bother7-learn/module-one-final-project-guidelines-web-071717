require_relative 'googlemaps'

class User < ActiveRecord::Base
include GoogleMaps

end
