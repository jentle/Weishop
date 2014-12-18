class AddSubscribesToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :subscribes, :integer
  end
end
