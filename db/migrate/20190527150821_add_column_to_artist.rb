class AddColumnToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :genre, :string
    add_column :artists, :name, :string
    add_column :artists, :price, :integer
    add_column :artists, :description, :string
    add_column :artists, :photo, :string
  end
end
