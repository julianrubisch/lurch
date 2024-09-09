json.extract! message, :id, :body, :conversation_id, :messagable_id, :messagable_type, :created_at, :updated_at
json.url message_url(message, format: :json)
