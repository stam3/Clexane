class MedicineHistory < ActiveRecord::Base

	belongs_to :medicine
	scope :today, -> { where("DATE(actualHour) = ?", Date.today) }

  attr_accessible :actualHour, :isFirstHour, :medicine_id, :c_type
end
