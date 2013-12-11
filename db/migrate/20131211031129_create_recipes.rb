class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.integer :total_time

      t.timestamps
    end
  end
end
