require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {  url: ENV['REDIS_URL'],  size: (ENV['REDIS_SIZE'] || 1) }
end

require 'sidekiq/web'
run Sidekiq::Web
