require 'twitter'

@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'f0GidKtuTEDKhUo9KRv8oTHTn'
  config.consumer_secret = 'Zpto8PZa2DtRJCRwtrrEwk9aluCOkyYN3QY6L2uivUuoPrDiUc'
  config.access_token = '74282467-2qwuw312kRAGSCuQwtxQx3UAwQswAvbmfjRHU3VAA'
  config.access_token_secret = 'dS9MlX9mhNd5AXEKztvTNyQpnUJMcHmdCAHMJ4zpeW9nZ'
end

