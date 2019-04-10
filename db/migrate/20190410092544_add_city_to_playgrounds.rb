class AddCityToPlaygrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :playgrounds, :city, :string
  end
end
