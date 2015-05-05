Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'], :fields => ['id', 'email-address', 'first-name', 'last-name']
end