class CreateHikingTrails < ActiveRecord::Migration

  # "Prop_ID", "Name", "Location", "Park_Name", "Length", "Difficulty",
  # "Other_Details", "Accessible", "Limited_Access", "lat", "lon"
  def change
    create_table :hiking_trails do |t|
      t.string :name
      t.string :location
      t.string :park_name
      t.string :length
      t.string :difficulty
      t.string :other_details
    end
  end


end
