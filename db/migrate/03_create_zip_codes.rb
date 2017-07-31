class CreateZipCodes < ActiveRecord::Migration


  def change
    create_table :zip_codes do |t|
      t.integer :zipcode
      t.string :borough
    end
  end
end
