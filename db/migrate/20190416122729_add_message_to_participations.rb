class AddMessageToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :message, :string
  end
end
