class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postcode
      t.string :country
      t.string :name
      t.string :phone
      t.time :opening
      t.time :closing
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
