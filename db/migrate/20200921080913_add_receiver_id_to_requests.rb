class AddReceiverIdToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :receiver_id, :integer
    add_index :requests, :receiver_id
  end
end
