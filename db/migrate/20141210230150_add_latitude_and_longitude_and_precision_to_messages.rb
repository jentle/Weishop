class AddLatitudeAndLongitudeAndPrecisionToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :latitude, :float
    add_column :messages, :longitude, :float
    add_column :messages, :precision, :float
  end
end
