json.array!(@messages) do |message|
  json.extract! message, :id, :dod, :tod, :dow, :title
  json.url message_url(message, format: :json)
end
