class InstaController < ApplicationController
    def index
        @instagram = Instagram.media_popular({:count => 2})
        @instagramga = Instagram.media_search("34.012836", "-118.495338", {:count => 4})
        #@instagramla = Instagram.location_search("34.012836", "-118.495338", {:count => 1})
       
 
    @tag = Instagram.tag_recent_media( "cat", {:count => 2})
        end
    end

