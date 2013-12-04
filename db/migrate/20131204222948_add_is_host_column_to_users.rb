class AddIsHostColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_host, :boolean
  end
end
