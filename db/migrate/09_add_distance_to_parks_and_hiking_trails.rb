class AddDistanceToParksAndHikingTrails < ActiveRecord::Migration[5.0]

  def change
    add_column :hiking_trails, :distance, :string
    add_column :parks, :distance, :string
  end

end
