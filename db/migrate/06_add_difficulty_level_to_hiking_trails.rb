class AddDifficultyLevelToHikingTrails < ActiveRecord::Migration[5.0]

  def change
    add_column :hiking_trails, :difficulty_level, :integer
  end
end
