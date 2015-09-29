class AddRatingToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :rating_id, :integer
    add_index :posts, :rating_id
  end
end
