
require 'dotenv'
require 'roda'

env = ENV['RACK_ENV'] || 'development'
is_dev = env == 'development'

Dotenv.load(['.env', env].compact.join('.'), '.env')

if is_dev
    require 'logger'

    LOGGER = Logger.new("./log/#{env}.log")
    LOGGER.level = Logger::DEBUG
end

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new(subclasses: %w[Roda Sequel::Model], logger: LOGGER, reload: is_dev) { App }
Unreloader.require('./config/app.rb') #{ App }

require_relative 'models'