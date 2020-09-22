class AddSenderIdToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :sender_id, :integer
    add_index :requests, :sender_id
  end
end
