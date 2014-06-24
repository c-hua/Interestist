class NewsController < ApplicationController

  require 'json'
require 'rubygems'
require 'twitter'
# require 'tweetstream'
before_action :twitter_init
respond_to :json, :html


  def index
  	@keyword = params[:keyword]

  	# using the usa today API
  	@usatoday = Page.party("\"#{@keyword}\"")[0]


  	# using Instagram API

        # @instagram = Instagram.media_popular({:count => 2})
        # @instagramga = Instagram.media_search("34.012836", "-118.495338", {:count => 4})
        # #@instagramla = Instagram.location_search("34.012836", "-118.495338", {:count => 1})
       
 
    @tag = Instagram.tag_recent_media( "#{@keyword}", {:count => 4})
    @s = params[:keyword]
      get_tweets(@s)
        end


  	# using Twitter API
    #keyword.sort(), then keyword.join()

    def new
    @tweets = Tweet.new
  end

  def create
    # @tweets = Tweet.new(search_params)
    # @tweets.user = current_user
    @tweets = Tweet.new(params.require(:search).permit(:term))

    if @tweets.save
      redirect_to tweets_path
    else
      render :new
    end
  end


  def show
    result = @response.body
  end

  def reload
    result = @response.body
  end

private

  def twitter_init

    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key       = 'ehL1FE96FkagGj8vFjmHGrK4O'
  config.consumer_secret    = 'hKQkrZeZoGdXzl0zmV5ySkbGLuGZiPGrFprsHlzSjpW9bYeA8u'
  config.access_token        = '357271373-J8dFugP7IhOOXRzzNqpKO7dGYbkxx2fiE0myqwRl'
  config.access_token_secret = 'NvjFhYSUC3dU1RKoHKfXnFhDhKQcN8ZokQHZnXE6YTnoT'
    end
  end

 def search_params
    params.require(:search).permit(:terms_attributes => [:text])
  end

  def get_tweets(search)

    @tweets = @twitter.search(search, :result_type => "recent").take(15)

  end
end

 

