class CreateTwitterUser < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :screen_name
      t.timestamps
    end

    create_table :tweets do |t|
      t.string :uid
      t.string :content
      t.references :twitter_user
      t.timestamps
    end
  end
end
