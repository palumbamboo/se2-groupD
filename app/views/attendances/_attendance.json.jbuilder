json.extract! attendance, :id, :date, :type, :enters_at, :exits_at, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
