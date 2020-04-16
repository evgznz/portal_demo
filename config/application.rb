require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Renom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Moscow'
    config.encoding = "utf-8"
    config.autoload_paths << Rails.root.join('lib/*')
    config.eager_load_paths << Rails.root.join('lib')
    config.secret_key_base = ENV["SECRET_KEY_BASE"] 
    #config.autoload_paths += %W( lib/ )
    #config.load_defaults = true
    #config.eager_load = true
    #config.paths.add Rails.root.join('lib').to_s, autoload: true
    #  config.i18n.default_locale = :ru
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
