json.array!(@computers) do |computer|
  json.extract! computer, :name, :serial
  json.url computer_url(computer, format: :json)
end
