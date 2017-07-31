class CreateZipCodes < ActiveRecord::Migration[5.0]


  def change
    create_table :zip_codes do |t|
      t.string :zipcode
      t.string :borough
    end
  end
end
