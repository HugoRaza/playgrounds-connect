class Update
  def self.statuses
    Participation.all.each(&:update_status)
  end
end
