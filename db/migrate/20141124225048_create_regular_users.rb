class CreateRegularUsers < ActiveRecord::Migration
  def change
  	drop_table :regular_users
  	
    create_table :regular_users do |t|

      t.timestamps
    end
  end
end
