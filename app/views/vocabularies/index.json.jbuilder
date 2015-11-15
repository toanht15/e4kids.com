json.array!(@vocabularies) do |vocabulary|
  json.extract! vocabulary, :id, :word, :mean, :subject_id
  json.url vocabulary_url(vocabulary, format: :json)
end
