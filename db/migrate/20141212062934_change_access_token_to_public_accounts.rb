class ChangeAccessTokenToPublicAccounts < ActiveRecord::Migration
  def change
    change_column :public_accounts, :access_token ,:text
  end
end
