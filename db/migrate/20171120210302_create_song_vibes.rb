class CreateSongVibes < ActiveRecord::Migration[5.1]
  def change
    create_table :song_vibes do |t|
      t.integer :song_id
      t.integer :vibe_id
      t.integer :level
      t.timestamps
    end
  end
end