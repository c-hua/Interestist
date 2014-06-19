require 'json'
require 'rubygems'
require 'twitter'

class TwitterSearchController < ApplicationController
  def index
  	# json = File.read(Rails.root + "app/assets/tweets.json")
  	# @tweets = JSON.parse(json)
  	@tweets = Tweet.all.where
  end

  def reload
  	redirect_to :root
  end

end
