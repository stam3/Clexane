class User < ActiveRecord::Base

	has_many :medicines, dependent: :destroy
  has_many :medicine_histories, :through => :medicines
  has_many :clexane_histories, dependent: :destroy, order: 'shotDate DESC'
	has_one :picklines
  
  attr_accessible :email, :password, :password_confirmation
  validates :email, presence: true, uniqueness: true
  has_secure_password
  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
  end

end
