class CreateSingleWalks < ActiveRecord::Migration
  def change
    create_table :single_walks do |t|

      t.timestamps
    end
  end
end
