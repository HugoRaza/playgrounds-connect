class Playground < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :participations
  has_many :users, through: :participations
  validates :name, uniqueness: true
end
