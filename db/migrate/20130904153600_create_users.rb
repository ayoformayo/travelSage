class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :provider
      t.integer :uid
      t.integer :status
      t.timestamps
    end
  end
end
