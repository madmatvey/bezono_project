json.array!(@explanations) do |explanation|
  json.extract! explanation, :id, :message, :user_id, :demand_id, :organization_profile_id
  json.url explanation_url(explanation, format: :json)
end
