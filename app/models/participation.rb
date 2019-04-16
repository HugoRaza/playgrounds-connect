class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :playground

  def update_status
    if start_date > Time.now
      status = "coming"
    elsif end_date < Time.now
      status = "finished"
    else
      status = "ongoing"
    end
    self.update!(status: status)
  end
end
