OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '313457632330-3a72fda4mlhcfr95lmq0lsc9imrtf319.apps.googleusercontent.com', 'JXMc05OrJN9ZzHx0dUzYOzvI', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end