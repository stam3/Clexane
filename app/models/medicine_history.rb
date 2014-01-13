class MedicineHistory < ActiveRecord::Base

	belongs_to :medicine
	
	scope :today, -> { where("DATE(actualHour) = ?", Date.today) }
	scope :specificMedicineToday, lambda{ |medicine_id| where(medicine_id: medicine_id) unless medicine_id.nil? }

  attr_accessible :actualHour, :isFirstHour, :medicine_id, :c_type
end
