class ChangeDateFormatInPicklines < ActiveRecord::Migration
  def up
  	change_column :picklines, :red_last_wash_date, :timestamp
  	change_column :picklines, :blue_last_wash_date, :timestamp
  	change_column :picklines, :bandage_replacement_date, :timestamp
  	change_column :picklines, :blue_ventile_replacement_date, :timestamp
  	change_column :picklines, :red_ventile_replacement_date, :timestamp
  	change_column :picklines, :parpar_replacement_date, :timestamp
  end

  def down
  	change_column :picklines, :red_last_wash_date, :date
  	change_column :picklines, :blue_last_wash_date, :date
  	change_column :picklines, :bandage_replacement_date, :date
  	change_column :picklines, :blue_ventile_replacement_date, :date
  	change_column :picklines, :red_ventile_replacement_date, :date
  	change_column :picklines, :parpar_replacement_date, :date
  end
end
