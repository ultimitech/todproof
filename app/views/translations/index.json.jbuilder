json.array!(@translations) do |translation|
  json.extract! translation, :id, :lan, :tran_title, :descrip, :blkc, :subc, :senc, :xcrip, :message_id
  json.url translation_url(translation, format: :json)
end
