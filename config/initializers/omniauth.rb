Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "162793910752484", "0e9b03b815e77604224af7de45a7aec1"
end