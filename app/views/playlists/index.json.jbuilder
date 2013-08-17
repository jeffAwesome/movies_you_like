json.array!(@playlists) do |playlist|
  json.extract! playlist, :title
  json.url playlist_url(playlist, format: :json)
end
