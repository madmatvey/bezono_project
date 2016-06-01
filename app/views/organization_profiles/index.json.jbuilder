json.array!(@organization_profiles) do |organization_profile|
  json.extract! organization_profile, :id, :value, :unrestricted_value
  json.url organization_profile_url(organization_profile, format: :json)
end
