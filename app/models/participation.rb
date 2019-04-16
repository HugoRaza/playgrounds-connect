class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :playground




    def define_status
      if self.start_date > Time.now
        "coming"
      elsif self.end_date < Time.now
        "finished"
      else
        "ongoing"
      end
    end
end
