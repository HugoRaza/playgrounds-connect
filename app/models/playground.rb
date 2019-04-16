class Playground < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  has_many :participations
  validates :name, uniqueness: true
end
