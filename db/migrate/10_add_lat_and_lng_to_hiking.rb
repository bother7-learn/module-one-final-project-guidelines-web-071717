class AddLatAndLngToHiking < ActiveRecord::Migration

  def change
    add_column :hiking_trails, :lat, :float
    add_column :hiking_trails, :lng, :float
  end


end
