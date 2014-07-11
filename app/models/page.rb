class Page < ActiveRecord::Base


  def self.party(search)

		limit ||= 80

		auth = { query: { apikey: '4rqbjazzjfu3mzwnrtyfpvku', limit: limit, fl: 'd', sort: 'recency', fts: search}} # Adds to end of URL ?apikey=<YOURKEY>&q=<MOVIE>
		search_url = "http://api.usatoday.com/open/articles/topnews"
		if search
			response = HTTParty.get "http://api.usatoday.com/open/articles?keyword="+URI::escape(search)+"&api_key=4rqbjazzjfu3mzwnrtyfpvku"
		else
			response = HTTParty.get "http://api.usatoday.com/open/articles?api_key=4rqbjazzjfu3mzwnrtyfpvku"
		end
		response.parsed_response["rss"]["channel"]["item"]

	
	
	end
end
