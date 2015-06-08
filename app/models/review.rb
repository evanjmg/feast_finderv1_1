class Review < ActiveRecord::Base
  validates :comment, length: { minimum: 5 }
  MEAL_SIZE = [1, 2, 3, 4, 5]
  validates :meal_size, inclusion: { in: MEAL_SIZE, message: "must be one of the choices"}
  belongs_to :place
  belongs_to :user
end
