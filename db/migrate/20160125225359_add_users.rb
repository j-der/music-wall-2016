class AddUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
      t.string :username
      t.string :password
      t.string :songs
      t.integer :upvotes
    end
  end

  add_reference :songs, :user
end
