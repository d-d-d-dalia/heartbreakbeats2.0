class RemoveVibesFromSongs < ActiveRecord::Migration[5.1]
  def change
  	remove_column :songs, :vibes
  end
end