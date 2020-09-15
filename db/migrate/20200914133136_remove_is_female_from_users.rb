class RemoveIsFemaleFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_female, :boolean
  end
end
