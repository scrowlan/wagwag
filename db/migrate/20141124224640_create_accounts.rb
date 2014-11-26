class CreateAccounts < ActiveRecord::Migration
  def change
  	drop_table :accounts
  	
    create_table :accounts do |t|
      t.references :user, index: true
      t.string :uid
      t.string :provider
      t.string :username
      t.string :oauth_token
      t.string :oauth_secret
      t.datetime :ouath_expires

      t.timestamps
    end
  end
end
