class AddRemoteProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remote_profile, :string
  end
end
