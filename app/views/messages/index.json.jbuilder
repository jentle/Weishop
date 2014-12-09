json.array!(@messages) do |message|
  json.extract! message, :id, :to_user_name, :create_time, :msg_type, :content, :msg_id, :media_id, :pic_url, :format, :thumb_media_id
  json.url message_url(message, format: :json)
end
