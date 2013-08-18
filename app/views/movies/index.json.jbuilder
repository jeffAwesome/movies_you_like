json.array!(@movies) do |movie|
  json.extract! movie, :playlist_id, :title, :thumbnail, :mov_id
  json.url movie_url(movie, format: :json)
end
