class CreateOAuthUsers < ActiveRecord::Migration
  def change
    create_table :o_auth_users do |t|
      t.string :provider
      t.string :user

      t.timestamps
    end
  end
end
