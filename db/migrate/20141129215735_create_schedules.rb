class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.string :location
      t.references :user, index: true
      t.text :note
      t.date :date

      t.timestamps
    end
  end
end
