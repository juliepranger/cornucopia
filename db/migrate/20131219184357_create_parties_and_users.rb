class CreatePartiesAndUsers < ActiveRecord::Migration
  def change
   
    create_table :parties_users do |p|

      p.belongs_to :party
      p.belongs_to :user

    end
  end
end
