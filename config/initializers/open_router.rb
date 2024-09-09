OpenRouter.configure do |config|
  config.access_token = ENV["OPENROUTER_API_KEY"]
  config.site_name = "Lurch"
  config.site_url = "https://lurch.chat"
end
