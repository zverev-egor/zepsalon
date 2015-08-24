json.array!(@infos) do |info|
  json.extract! info, :id, :description
  json.url info_url(info, format: :json)
end
