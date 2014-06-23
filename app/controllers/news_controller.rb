class NewsController < ApplicationController
  def index
  	@keyword = params[:keyword]

  	# using the usa today API
  	@usatoday = Page.party("\"#{@keyword}\"")[0]

  	# using Instagram API


  	# using Twitter API


  end
end
