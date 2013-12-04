class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :date
      t.string :location
      t.string :email
      t.string :userid
      t.string :host_id
      t.array :guest_list

      t.timestamps
    end
  end
end
