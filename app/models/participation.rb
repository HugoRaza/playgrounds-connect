class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :playground

  validates :status, inclusion: { in: %w[coming ongoing finished] }
end
