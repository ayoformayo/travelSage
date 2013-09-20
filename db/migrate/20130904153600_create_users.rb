class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :handle
      t.string :name
      t.integer :status
      t.timestamps
    end
  end
end
