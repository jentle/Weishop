class CreatePublicAccounts < ActiveRecord::Migration
  def change
    create_table :public_accounts do |t|
      t.string :name
      t.string :access_token

      t.timestamps
    end
  end
end
