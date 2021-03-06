require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BackRakuten
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # origins '*'
        origins 'https://teddytime.work','http://teddytime.work'
        # origins 'http://mementotime.net','https://mementotime.net','http://localhost:8080','https://teddytime.work','http://teddytime.work'
        # origins 'http://54.64.212.72', 'http://mementotime.net','https://mementotime.net','http://localhost:8080','http://54.168.139.169','http://3.114.129.4','http://test-856344640.ap-northeast-1.elb.amazonaws.com','http://localhost:80', '127.0.0.1:80'
        # origins 'http://localhost:8080'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['books'],
        credentials: true #??????????????????
      end

    end
  end
end
