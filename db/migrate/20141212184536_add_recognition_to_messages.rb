class AddRecognitionToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recognition, :text
  end
end
