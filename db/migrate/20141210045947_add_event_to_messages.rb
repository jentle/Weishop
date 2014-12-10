class AddEventToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :event, :string
  end
end
