class AddOfficialNameToPublicAccounts < ActiveRecord::Migration
  def change
    add_column :public_accounts, :official_name, :string
  end
end
