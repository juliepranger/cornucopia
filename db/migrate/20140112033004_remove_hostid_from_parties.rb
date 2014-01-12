class RemoveHostidFromParties < ActiveRecord::Migration
  def change
  	remove_column :parties, :host_id, :string
  end
end
