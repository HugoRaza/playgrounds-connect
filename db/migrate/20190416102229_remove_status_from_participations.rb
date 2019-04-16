class RemoveStatusFromParticipations < ActiveRecord::Migration[5.2]
  def change
    remove_column :participations, :status, :string
  end
end
