class Playground < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  has_many :participations, dependent: :destroy
  validates :name, uniqueness: true

  def self.search(city)
    if city
      where(city: city.join.downcase)
    else
      all
    end
  end

  def current_participations_count
    participations.where(status: "ongoing").count
  end

  def coming_participations_count
    participations.where("start_date > NOW() and start_date < (NOW() + INTERVAL '1 DAY')").count
  end
end
