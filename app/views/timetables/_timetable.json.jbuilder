json.extract! timetable, :id, :subject, :day_of_week, :start_time, :end_time, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
