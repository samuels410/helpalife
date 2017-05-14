Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "#{Settings.omniauth.facebook_key}", "#{Settings.omniauth.facebook_secret}",
           client_options: {
               site: 'https://graph.facebook.com/v2.3',
               authorize_url: "https://www.facebook.com/v2.3/dialog/oauth"
           }
  provider :linkedin, "#{Settings.omniauth.linkedin_key}", "#{Settings.omniauth.linkedin_secret}"
  provider :google_oauth2, "#{Settings.omniauth.google_oauth2_key}", "#{Settings.omniauth.google_oauth2_secret}"

end