class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_index :friend_requests, :request_receiver
    add_index :friend_requests, :request_sender
    add_index :friendships, :receiver_id
    add_index :friendships, :sender_id
    add_index :friendships, [:sender_id, :sender_id]
    add_index :likes, :author_id
    add_index :likes, [:likeable_id, :likeable_type]
    add_index :posts, :author_id
  end
end
