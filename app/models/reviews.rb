class Review < ActiveRecord::Base
belongs_to :user
belongs_to :hiking_trail

attr_reader :user, :hiking_trail, :desc

  def initialize(user, hiking_trail, desc)
    @user = user
    @hiking_trail = hiking_trail
    @desc = desc
    self.save
  end

end
