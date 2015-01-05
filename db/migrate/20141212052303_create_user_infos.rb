class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :subscribe
      t.string :openid
      t.string :nickname
      t.integer :sex
      t.string :city
      t.string :country
      t.string :province
      t.string :language
      t.text :headimgurl
      t.integer :subscribe_time
      t.string :unionid
      t.integer :public_account_id
      
      t.timestamps
    end
  end
end
