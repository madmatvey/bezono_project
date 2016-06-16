json.array!(@demands) do |demand|
  json.extract! demand, :id, :name, :description, :organization_profile_id
  json.url demand_url(demand, format: :json)
end
