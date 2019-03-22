class AddPictureToPlaygrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :playgrounds, :playground_picture, :string
  end
end
