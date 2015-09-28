class AddUserToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :intenger
    add_index :comments, :user_id
  end
end
