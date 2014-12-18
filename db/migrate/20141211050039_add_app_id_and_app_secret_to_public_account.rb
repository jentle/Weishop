class AddAppIdAndAppSecretToPublicAccount < ActiveRecord::Migration
  def change
    add_column :public_accounts, :app_id, :string
    add_column :public_accounts, :app_secret, :string
  end
end
