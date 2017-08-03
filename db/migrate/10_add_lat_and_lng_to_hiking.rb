class AddLatAndLngToHiking < ActiveRecord::Migration[5.0]


  def change
    add_column :hiking_trails, :lat, :float
    add_column :hiking_trails, :lng, :float
  end


end
