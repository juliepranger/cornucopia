OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '371924336276277', 'cc1d64c369924952352d6b053ed98db9'
end