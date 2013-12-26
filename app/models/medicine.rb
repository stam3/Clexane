class Medicine < ActiveRecord::Base

	belongs_to :user
	has_many :medicine_histories, dependent: :destroy

  attr_accessible :canceledNotificationDate, :daysOffset, :daysOffsetStartDate, :firstHour, 
  					:isSpecificDays, :name, :secondHour, :specificDays#, :user_id

   validates :name, :user_id, presence: true 
 #  validates :price, numericality: {greater_than_or_equal_to: 0.01} 
 #  validates :title, uniqueness: true
 #  validates :image_url, allow_blank: true, format: {
 #    with:    %r{\.(gif|jpg|png)$}i,
	# message: 'must be a URL for GIF, JPG or PNG image.' 
 #  }
end
