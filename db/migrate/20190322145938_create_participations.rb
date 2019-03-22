class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.datetime :date
      t.time :duration
      t.string :status
      t.references :user, foreign_key: true
      t.references :playground, foreign_key: true

      t.timestamps
    end
  end
end
