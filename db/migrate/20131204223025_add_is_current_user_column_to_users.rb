class AddIsCurrentUserColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_current_user, :boolean
  end
end
