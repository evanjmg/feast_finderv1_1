class Cuisine < ActiveRecord::Base
	has_many :cuisinizations, dependent: :destroy
	has_many :places, through: :cuisinizations
	validates :name, presence: true, uniqueness: true
end
