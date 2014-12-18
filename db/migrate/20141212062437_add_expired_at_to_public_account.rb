class AddExpiredAtToPublicAccount < ActiveRecord::Migration
  def change
    add_column :public_accounts, :expired_at, :integer
  end
end
