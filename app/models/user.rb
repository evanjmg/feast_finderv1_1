class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6, allow_blank: true }
  validates :name, presence: true
  validates :email, presence: true, format:/\A\S+@\S+\z/,
  									uniqueness: { case_sensitive: false}
  has_many :reviews, dependent: :destroy
  has_many :check_ins, dependent: :destroy
  has_many :visited_places, through: :check_ins, source: :place
def gravatar_id                   
  Digest::MD5::hexdigest(email.downcase)
end

def self.authenticate(email, password)
	user = User.find_by(email: email)
	 user && user.authenticate(password)
end

end
