class RemovePostIdFromReplies < ActiveRecord::Migration[6.0]
  def change
    remove_index :replies, :post_id
    remove_column :replies, :post_id, :integer
  end
end
