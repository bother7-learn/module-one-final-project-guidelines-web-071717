class AddParkIdToHikingTrails < ActiveRecord::Migration[5.0]

  def change
    add_column :hiking_trails, :park_id, :integer
  end

end
