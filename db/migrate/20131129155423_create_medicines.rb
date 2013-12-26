class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :daysOffset
      t.date :firstHour
      t.date :secondHour
      t.boolean :isSpecificDays
      t.integer :specificDays
      t.date :canceledNotificationDate
      t.date :daysOffsetStartDate

      t.timestamps
    end
  end
end
