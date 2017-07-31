class CreateZipCodes < ActiveRecord::Migration


  def change
    create_table :zipcodes do |t|
      t.integer :zipcode
      t.string :borough
    end
  end
end
