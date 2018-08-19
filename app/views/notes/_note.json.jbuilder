json.extract! note, :id, :user_id, :title, :content, :remember_date, :created_at, :updated_at
json.url note_url(note, format: :json)
