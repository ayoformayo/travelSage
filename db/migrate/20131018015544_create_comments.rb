class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :commentable, polymorphic: true
      t.string :user_id

      t.timestamps
    end
  end
end
