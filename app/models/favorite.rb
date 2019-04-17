class Favorite < ApplicationRecord
  validates_uniqueness_of :city_id
  belongs_to :user
end
