class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :direction_num

      t.timestamps
    end
  end
end
