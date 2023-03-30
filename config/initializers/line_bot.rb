require 'line/bot'

Rails.application.config.middleware.use Line::Bot::Middleware do
  config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
end
