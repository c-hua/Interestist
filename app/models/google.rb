class Google < ActiveRecord::Base


  def self.party(search)

		limit ||= 80

		auth = { query: { limit: limit, fl: 'd', sort: 'recency', fts: search}} # Adds to end of URL ?apikey=<YOURKEY>&q=<MOVIE>
		search_url = "http://hawttrends.appspot.com/api/terms/"
		if search
			response = HTTParty.get "http://hawttrends.appspot.com/api/terms/"
		else
			response = HTTParty.get "http://hawttrends.appspot.com/api/terms/"
		end
		response.parsed_response["1"]
	
	end
end
