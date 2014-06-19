json.array!(@pages) do |page|
  json.extract! page, :url
  json.url page_url(page, format: :json)
end
