class ZipCode < ActiveRecord::Base

  def self.get_borough(zipcode)
    x = self.find_by(zipcode: zipcode)
    x.borough
  end

  def self.nearby_zipcodes(zipcode)
    borough = self.get_borough(zipcode)
    self.where(borough: borough).map do |zip|
      zip.zipcode
    end
  end


end
