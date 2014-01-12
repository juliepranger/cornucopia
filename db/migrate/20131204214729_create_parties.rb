class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :date
      t.string :location
      t.string :email
      t.string :userid
      t.string :guest_list

      t.timestamps
    end
  end
end
