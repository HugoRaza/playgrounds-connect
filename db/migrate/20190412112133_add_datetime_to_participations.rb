class AddDatetimeToParticipations < ActiveRecord::Migration[5.2]
  def change
    remove_column :participations, :duration
  end
end
