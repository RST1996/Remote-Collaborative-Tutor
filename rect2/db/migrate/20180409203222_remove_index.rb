class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
  	remove_index :comments, [:post_id,:user_id]
  end
end
