class Playground < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  has_many :participations, dependent: :destroy
  validates :name, uniqueness: true

  def self.search(term)
    if term
      where('city LIKE ?', "%#{term.downcase}%")
    else
      all
    end
  end
end
