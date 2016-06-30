json.array!(@competences) do |competence|
  json.extract! competence, :id, :tag
  json.url competence_url(competence, format: :json)
end
