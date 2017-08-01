class CreateReviews < ActiveRecord::Migration[5.0]

  def change
    create_table :reviews do |t|
      t.string :desc
      t.integer :user_id
      t.integer :park_id
    end
  end

end
