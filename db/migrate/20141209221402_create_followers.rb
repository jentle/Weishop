class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name
      t.integer :public_account_id
      t.timestamps
    end
  end
end
