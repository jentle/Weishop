class AddEventKeyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :event_key, :string
  end
end
