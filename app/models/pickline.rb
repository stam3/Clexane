class Pickline < ActiveRecord::Base

	belongs_to :user
  attr_accessible :bandage_interval_days, :bandage_replacement_date, 
  :blue_last_wash_date, :blue_ventile_replacement_date, :parpar_replacement_date, 
  :red_last_wash_date, :red_ventile_replacement_date, :user_id
end
