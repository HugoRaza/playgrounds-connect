class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :playground

  def update_status
    if start_date < Time.now && end_date > Time.now
      status = "ongoing"
    elsif start_date < Time.now && end_date < Time.now
      status = "coming"
    elsif start_date > Time.now && end_date > Time.now
      status = "finished"
    end
    self.update!(status: status)
  end
end
