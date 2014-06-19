class TwitterSearchController < ApplicationController


  def index
    require 'rubygems'
    require 'twitter'
   

    @twt = @tweet
    search = Twitter::Search.new
   
    search.result_type("recent").per_page(3).each do |r|
      puts "#{r.from_user}: #{r.text}"
    end
  end

  def new
  end

  def create
  end


  def edit
  end

  def update
  end

  def destroy
  end
end
