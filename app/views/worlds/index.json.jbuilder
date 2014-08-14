json.array!(@worlds) do |world|
  json.extract! world, :id, :name, :x, :y
  json.url world_url(world, format: :json)
end
