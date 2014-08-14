json.array!(@moves) do |move|
  json.extract! move, :id, :orientation, :xcoordinate, :xcoordinate, :robot_id
  json.url move_url(move, format: :json)
end
