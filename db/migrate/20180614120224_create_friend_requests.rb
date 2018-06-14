class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :request_sender
      t.integer :request_receiver

      t.timestamps
    end
  end
end
