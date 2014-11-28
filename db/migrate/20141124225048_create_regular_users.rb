class CreateRegularUsers < ActiveRecord::Migration
  def change

    create_table :regular_users do |t|

      t.timestamps
    end
  end
end
