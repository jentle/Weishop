class ChangeMsgIdToMessages < ActiveRecord::Migration
  def change
    change_column :messages , :msg_id, :integer,:limit => 8
  end
end
