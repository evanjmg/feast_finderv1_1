class Cuisinization < ActiveRecord::Base
  belongs_to :place
  belongs_to :cuisine
end
