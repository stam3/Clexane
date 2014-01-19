class ClexaneHistory < ActiveRecord::Base

	belongs_to :user
	
  attr_accessible :dosage, :isRight, :shotDate, :user_id
end
