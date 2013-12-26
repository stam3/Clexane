class ChangeDateFormatInMedicines < ActiveRecord::Migration
  def up
  	change_column :medicines, :firstHour, :timestamp
  	change_column :medicines, :secondHour, :timestamp
  	change_column :medicines, :canceledNotificationDate, :timestamp
  	change_column :medicines, :daysOffsetStartDate, :timestamp
  end

  def down
  	change_column :medicines, :firstHour, :date
  	change_column :medicines, :secondHour, :date
  	change_column :medicines, :canceledNotificationDate, :date
  	change_column :medicines, :daysOffsetStartDate, :date
  end
end
