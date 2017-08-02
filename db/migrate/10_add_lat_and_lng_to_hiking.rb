<<<<<<< HEAD
class AddLatAndLngToHiking < ActiveRecord::Migration
=======
class AddLatAndLngToHiking < ActiveRecord::Migration[5.0]
>>>>>>> master

  def change
    add_column :hiking_trails, :lat, :float
    add_column :hiking_trails, :lng, :float
  end


end
