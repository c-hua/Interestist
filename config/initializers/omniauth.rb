OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '408464380077-qs6tanidu5bivfotu3j9q6p5dtudq1pn.apps.googleusercontent.com', 'qHogpVjpvRG_6HXDIB4TEAT3', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end