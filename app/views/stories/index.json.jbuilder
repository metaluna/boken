json.array!(@stories) do |story|
  json.extract! story, :id, :title, :abstract
  json.url story_url(story, format: :json)
end
