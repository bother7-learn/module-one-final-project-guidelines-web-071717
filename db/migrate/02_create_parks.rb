class CreateParks < ActiveRecord::Migration

  # "Prop_ID", "Name", "Location", "Zip"

  def change
    create_table :parks do |t|
      t.integer :prop_id
      t.string :name
      t.string :location
      t.integer :zip
    end
  end

end
