class CreatePlaygrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :playgrounds do |t|
      t.string :name
      t.string :address
      t.integer :rims_number
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
