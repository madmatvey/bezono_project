json.array!(@organization_accounts) do |organization_account|
  json.extract! organization_account, :id
  json.url organization_account_url(organization_account, format: :json)
end
