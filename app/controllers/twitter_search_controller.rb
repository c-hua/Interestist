class TwitterSearchController < ApplicationController

require 'json'
require 'rubygems'
require 'twitter'
# require 'tweetstream'
respond_to :json, :html

  def index
  	# json = File.read(Rails.root + "app/assets/tweets.json")
  	# @tweets = JSON.parse(json)
  	@tweets = Tweet.new

  	if params[:term]
  		@s = Tweet.find(params[:term])
  		get_tweets(@s)
  	end

  	@tweets = Tweet.all
  	respond_to do |format|
  		format.html
  		format.json do
  			render json: @tweets
  		end
  	end
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

 def search_params
    params.require(:search).permit(:terms_attributes => [:text])
  end

  def get_tweets(search)

    if search.terms[0]
      @tweets = @twitter.search(search.terms[0].text, :result_type => "recent").take(100)      
      5.times do
        last_id = @tweets.last.id - 1
        @tweets = @tweets + @twitter.search(search.terms[0].text, max_id: last_id, result_type: "recent").take(100)
      end
    else
      @tweets = nil
    end
end
end

