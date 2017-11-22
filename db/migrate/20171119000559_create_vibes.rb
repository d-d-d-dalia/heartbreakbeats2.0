class CreateVibes < ActiveRecord::Migration[5.1]
  def change
    create_table :vibes do |t|
    	t.string :name
    end
  end
end
