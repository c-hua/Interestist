OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '408464380077-o127hgsbb8h1c4fcqltrapgtg7pgta3q.apps.googleusercontent.com', '_O-buwImZPRUqarpXAt4KQ9c', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end