json.array!(@edits) do |edit|
  json.extract! edit, :id, :content, :hid
  json.url edit_url(edit, format: :json)
end
