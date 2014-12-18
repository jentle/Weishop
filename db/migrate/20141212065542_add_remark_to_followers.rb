class AddRemarkToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :remark, :string
  end
end
