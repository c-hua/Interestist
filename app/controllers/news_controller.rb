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
    array = @keyword.scan("vs")

    if array.length > 0
      @keyword = @keyword.split(' ')[0]
      @usatoday = Page.party("\"#{@keyword}\"")[0]
    else
  	  @usatoday = Page.party("\"#{@keyword}\"")[0]
    end

    # if @keyword contains "vs") or contains ('0 - 9')
    #  Page.party("\"#{@keyword}\"".split(" ").first)[0]
    #  ex2 = "netherlands vs spain"
    #  ex2.spit(" ").first
    #  ex.scan("vs")
    #  array = ex.scan("vs")
    #  array
    #  array[0] == "vs"
    #  ex.sub(/["vs"]/,"")
    #  ex.sub(/[vs]/, "")"vs"

    #   def index
    # @keyword = params[:keyword]

    # # using the usa today API
    # array = @keyword.scan("vs")

    # if array[0] == "Vs"|| "vs"

    #   Page.party("\"#{@keyword}\"".split(" ").first)[0]
    #   binding.pry
    # else
    #   @usatoday = Page.party("\"#{@keyword}\"")[0]
    # end


  	# using Instagram API

        # @instagram = Instagram.media_popular({:count => 2})
        # @instagramga = Instagram.media_search("34.012836", "-118.495338", {:count => 4})
        # #@instagramla = Instagram.location_search("34.012836", "-118.495338", {:count => 1})
       
 
    @tag = Instagram.tag_recent_media( "#{@keyword}".gsub(/\s+/, ""), {:count => 4})
    @s = params[:keyword]
      get_tweets(@s)
        
      end


  	# using Twitter API
    #keyword.split(), then keyword.join()

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

 

