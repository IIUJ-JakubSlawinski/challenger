Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '395067703895268', '1d3e820888651e0df0a370a195618a8c'
end
OmniAuth.config.on_failure = SessionsController.action(:omniauth_callback_error)