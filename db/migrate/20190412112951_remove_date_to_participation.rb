class RemoveDateToParticipation < ActiveRecord::Migration[5.2]
  def change
    remove_column :participations, :date
  end
end
