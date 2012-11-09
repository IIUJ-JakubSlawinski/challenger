Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '395067703895268', 'secret'
end
OmniAuth.config.on_failure = SessionsController.action(:omniauth_callback_error)