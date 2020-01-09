json.extract! note, :id, :subject, :description, :date, :created_at, :updated_at
json.url note_url(note, format: :json)
