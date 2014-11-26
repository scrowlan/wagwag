OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '726640617389215', '88a65885290155834bdebdd329890dd0'
end