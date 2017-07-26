class AddPaperclipToListings < ActiveRecord::Migration[5.1]
  def change
    add_attachment :listings, :image #add this line
  end
end
