class TwitterSearchController < ApplicationController


  def index
    require 'rubygems'
    require 'twitter'
   
    Twitter.configure do |config|
     config.consumer_key = 'f0GidKtuTEDKhUo9KRv8oTHTn'
      config.consumer_secret = 'Zpto8PZa2DtRJCRwtrrEwk9aluCOkyYN3QY6L2uivUuoPrDiUc'
      config.access_token = '74282467-2qwuw312kRAGSCuQwtxQx3UAwQswAvbmfjRHU3VAA'
      config.access_token_secret = 'dS9MlX9mhNd5AXEKztvTNyQpnUJMcHmdCAHMJ4zpeW9nZ'
    end

    search = Twitter::Search.new
   
    search.containing("marry me").to("justinbieber").result_type("recent").per_page(3).each do |r|
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
