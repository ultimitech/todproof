json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :blk, :rsub, :sen, :typ, :tie, :translation_id
  json.url sentence_url(sentence, format: :json)
end
