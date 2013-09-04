class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :city_id
      t.integer :article_id
      t.timestamps
    end
  end
end
