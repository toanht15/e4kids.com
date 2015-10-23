json.array!(@user_goals) do |user_goal|
  json.extract! user_goal, :id, :numbers_of_words, :start_time, :end_time, :user_id
  json.url user_goal_url(user_goal, format: :json)
end
