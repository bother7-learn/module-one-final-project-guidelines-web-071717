class Park < ActiveRecord::Base
has_many :hiking_trails


  def self.nearby_parks(zipcodes)
    park_list = []
    zipcodes.each do |zip|
      self.where("zipcode like (?)", "%#{zip}%").each do |park|
        park_list << park
      end
    end
    park_list
  end


end
