class AddUserZipCode < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :zipcode, :integer
  end
end
