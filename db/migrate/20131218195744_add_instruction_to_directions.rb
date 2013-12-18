class AddInstructionToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :instruction, :string
  end
end
