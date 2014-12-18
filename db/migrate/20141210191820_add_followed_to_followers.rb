class AddFollowedToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :followed, :bool
  end
end
