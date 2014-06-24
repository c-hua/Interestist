class TwitterSearchController < ApplicationController

require 'json'
require 'rubygems'
require 'twitter'
# require 'tweetstream'
before_action :twitter_init
respond_to :json, :html

  def index
  	# json = File.read(Rails.root + "app/assets/tweets.json")
  	# @tweets = JSON.parse(json)
  	#@tweets = Tweet.new

  	
  		@s = params[:term]
  		get_tweets(@s)
 

  	# @tweets = Tweet.all
  	# respond_to do |format|
  	# 	format.html
  	# 	format.json do
  	# 		render json: @tweets
  	# 	end
  	# end
  end

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

