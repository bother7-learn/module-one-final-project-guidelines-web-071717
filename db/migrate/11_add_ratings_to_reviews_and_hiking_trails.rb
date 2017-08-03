class AddRatingsToReviewsAndHikingTrails < ActiveRecord::Migration[5.0]

  def change
    add_column :reviews, :rating, :integer
    add_column :hiking_trails, :average_rating, :float
  end
end
