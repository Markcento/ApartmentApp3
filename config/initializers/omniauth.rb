# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],
#   provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'],
#     scope: 'email,user_birthday,read_stream', display: 'popup'
# end
