class Place < ActiveRecord::Base
	
	validates :name, presence:true, uniqueness: true
	validates :description, length: {minimum: 25}
	validates :price, numericality: { greater_than_or_equal_to: 0}
	validates :rating, numericality: { only_integer: true, greater_than: 0}
	validates :image_file_name, allow_blank: true, format: { with: /\w+\.(git|jpg|png)\z/i,
		message: "must be a GIF, JPG, or PNG image"}
	validates :slug, uniqueness: true
	has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
	has_many :check_ins, dependent: :destroy
	has_many :visitors, through: :check_ins, source: :user
	has_many :cuisines, through: :cuisinizations
	has_many :cuisinizations, dependent: :destroy
	
	before_validation :generate_slug

	scope :lowest_price, -> { order('price asc') }
	scope :highest_price, -> { order('average_price desc')}
	scope :largest_meal, -> { order('average_meal_size desc')}
	scope :location, ->(location="London") {where(location: location)}
	# scope :by_price, ->(price) {where.(price: price).sort_by_largest_meal}
	# scope :recent_reviews, -> where("review.created_at >= ?", Time.now).order(created_at: :desc).by_price }
	# :past_n_days, ->(days) { where('created_at >= ?' , days.days.ago) }
	def none?
		rating.blank? 
	end
	def average_meal_size
    reviews.average(:meal_size)
  end
	def average_price
    reviews.average(:price)
  end
  def to_param
  	slug
  end
  def generate_slug
  	self.slug ||= name.parameterize if name
  end
end
