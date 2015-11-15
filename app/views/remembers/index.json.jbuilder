json.array!(@remembers) do |remember|
  json.extract! remember, :id, :user_id, :vocabulary_id
  json.url remember_url(remember, format: :json)
end
