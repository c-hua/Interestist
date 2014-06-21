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

end

