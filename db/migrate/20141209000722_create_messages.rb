class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from_user_name 
      t.string :to_user_name
      t.integer :create_time
      t.string :msg_type
      t.text :content
      t.integer :msg_id
      t.string :media_id
      t.string :pic_url
      t.string :format
      t.string :thumb_media_id

      t.timestamps
    end
  end
end
