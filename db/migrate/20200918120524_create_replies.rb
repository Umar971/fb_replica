class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :body

      t.timestamps
    end
  end
end
