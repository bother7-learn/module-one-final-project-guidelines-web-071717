class CreateHikingTrails < ActiveRecord::Migration

  # "Prop_ID", "Name", "Location", "Park_Name", "Length", "Difficulty",
  # "Other_Details", "Accessible", "Limited_Access", "lat", "lon"
  def change
    create_table :hikingtrails do |t|
      t.integer :prop_id
      t.string :name
      t.string :location
      t.string :park_name
      t.string :length
      t.string :difficulty
      t.string :other_details
      t.string :accessible
      t.string :limited_access
      t.string :lat
      t.string :lon
    end
  end


end
