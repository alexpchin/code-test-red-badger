json.array!(@robots) do |robot|
  json.extract! robot, :id, :status, :planet_id
  json.url robot_url(robot, format: :json)
end
