require 'twitter'

@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'CONSUMER KEY'
  config.consumer_secret = 'CONSUMER SECRET KEY'
  config.access_token = 'ACCESS TOKEN'
  config.access_token_secret = 'ACCESS TOKEN SECRET KEY'
end

