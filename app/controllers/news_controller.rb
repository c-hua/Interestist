class NewsController < ApplicationController

require 'json'
require 'rubygems'
require 'twitter'
# require 'tweetstream'
before_action :twitter_init
respond_to :json, :html


  def index
  	@keyword = params[:keyword]

    # USA Today API

    @usatoday = Page.party("#{@keyword}")[0]
       
    #Instagram API    
 
    @tag = Instagram.tag_recent_media( "#{@keyword}".gsub(/\s+/, ""), {:count => 2})
    @s = params[:keyword]
      get_tweets(@s)
        
      end


  	# using Twitter API
    #keyword.split(), then keyword.join()

  def new
    @newsearch = current_user.searches.new
  end

  def create
#    raise params.inspect
    @keyword = params[:search][:keyword]

    @newsearch = current_user.searches.new(term: @keyword)

    if @newsearch.save
      redirect_to root_path
    else
      # print out error
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
  config.consumer_key       = 'CONSUMER KEY'
  config.consumer_secret    = 'CONSUMER SECRET KEY'
  config.access_token        = 'ACCESS TOKEN'
  config.access_token_secret = 'ACCESS TOKEN SECRET KEY'
    end
  end

 def search_params
    params.require(:search).permit(:terms_attributes => [:text])
  end

  def get_tweets(search)

    @tweets = @twitter.search(search, :result_type => "recent").take(15)

  end
end

 

