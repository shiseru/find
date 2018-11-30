json.extract! room, :id, :owner_id, :participant_id, :created_at, :updated_at
json.url room_url(room, format: :json)
