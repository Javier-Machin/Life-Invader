class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.integer :post_id
      t.integer :likeable_id
      t.string  :likeable_type

      t.timestamps
    end
  end
end
