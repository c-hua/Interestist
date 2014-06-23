class NewsController < ApplicationController
  def index
  	@keyword = params[:keyword]

  	# using the usa today API
  	@usatoday = Page.party("\"#{@keyword}\"")[0]

  	# using Instagram API

        # @instagram = Instagram.media_popular({:count => 2})
        # @instagramga = Instagram.media_search("34.012836", "-118.495338", {:count => 4})
        # #@instagramla = Instagram.location_search("34.012836", "-118.495338", {:count => 1})
       
 
    @tag = Instagram.tag_recent_media( "#{@keyword}", {:count => 4})
        end


  	# using Twitter API


 end

