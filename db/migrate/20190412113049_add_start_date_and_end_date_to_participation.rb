class AddStartDateAndEndDateToParticipation < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :start_date, :datetime
    add_column :participations, :end_date, :datetime
  end
end
