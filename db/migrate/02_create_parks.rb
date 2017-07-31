class CreateParks < ActiveRecord::Migration

  # "Prop_ID", "Name", "Location", "Zip"

  def change
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.integer :zipcode
    end
  end

end
