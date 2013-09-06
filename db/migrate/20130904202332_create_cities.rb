class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :province
      t.string :country
      t.timestamps
    end
  end
end