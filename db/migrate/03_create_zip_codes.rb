class CreateZipCodes < ActiveRecord::Migration[5.0]


  def change
    create_table :zip_codes do |t|
      t.integer :zipcode
      t.string :borough
    end
  end
end
