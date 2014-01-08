class AddInstructionToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :instruction, :text, :limit => 10000
  end
end
